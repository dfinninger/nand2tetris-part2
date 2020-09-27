package VMTranslator

/** Writer
 *
 * General naming conventions for sanity:
 * - cmd:             Higher-level, implements a [[Command]]'s functionality
 * - load:            Stores the desired value into the "D" register
 * - access:          Manipulates registers such that the "M" register points to the correct memory value
 * - {inc,dec}rement: Manipulate the specified pointer and leave the updated address in the "A" register
 */
class Writer(commands: List[Command]) {
  private val TRUE = -1 // 0xFFFF
  private val FALSE = 0 // 0x0000
  private val REG_13 = "R13"
  private val REG_RETURN = "R14"
  private val REG_FRAME = "R7"

  private var jumpCounter = 0 // keep track of the number of jumps so that we can generate unique labels
  private var namespace = "default" // keep track of the current filename
  private var function = "default" // keep track of the current function

  /** Render the list of [[Command]]s into a String of Machine Code
   *
   * @return Machine code representing the input [[Command]] list
   */
  def render(): String = {
    commands.map(cmd => {
      val comment = s"// == $cmd =="
      val result = cmd match {
        // Arithmetic / Logical Commands
        case Arithmetic("add") => cmdArithmeticDualArgOp("+")
        case Arithmetic("sub") => cmdArithmeticDualArgOp("-")
        case Arithmetic("and") => cmdArithmeticDualArgOp("&")
        case Arithmetic("or") => cmdArithmeticDualArgOp("|")

        case Arithmetic("neg") => cmdArithmeticSingleArgOp("-")
        case Arithmetic("not") => cmdArithmeticSingleArgOp("!")

        case Arithmetic("eq") => cmdComparisonDualArgOp("JEQ")
        case Arithmetic("gt") => cmdComparisonDualArgOp("JGT")
        case Arithmetic("lt") => cmdComparisonDualArgOp("JLT")

        // Memory Access commands
        case Push(segment, offset) => cmdPush(segment, offset)
        case Pop(segment, offset) => cmdPop(segment, offset)

        // Program Flow Commands
        case Label(label) => cmdLabel(label)
        case Goto(label) => cmdGoto(label)
        case IfGoto(label) => cmdIfGoto(label)

        // Function Commands
        case Function(name, varCount) => cmdFunction(name, varCount)
        case Call(name, argCount) => cmdCall(name, argCount)
        case Return() => cmdReturn()

        case _ => throw new RuntimeException("unable to assemble command")
      }
      comment + "\n" + result
    }).mkString.replaceAll("\n+", "\n")
  }

  /** Generate ML for a one-argument operation and store the result on the stack
   *
   * @param op operator to use: (!, -)
   * @return ML for the operation
   */
  private def cmdArithmeticSingleArgOp(op: String) =
    s"""
       |$decrementStackPointer
       |$accessTopOfStack
       |M=${op}M
       |$incrementStackPointer
       |""".stripMargin

  /** Generate ML for a two-argument operation and store the result on the stack
   *
   * @param op operator to use: (+, -, |, &)
   * @return ML for the arithmetic operation
   */
  private def cmdArithmeticDualArgOp(op: String): String =
    s"""
       |$decrementStackPointer
       |$loadPointerValue
       |$decrementStackPointer
       |A=M
       |M=M${op}D
       |$incrementStackPointer
       |""".stripMargin

  /** Generate ML for a two-argument comparison, and push the result onto the stack
   *
   * @param op operator to use: (JEQ, JLT, JGT)
   * @return ML for the comparison operation
   */
  private def cmdComparisonDualArgOp(op: String): String = {
    jumpCounter += 1
    Predef.augmentString(
      s"""
         |$decrementStackPointer
         |$loadPointerValue
         |$decrementStackPointer
         |A=M
         |D=M-D
         |@CMP_TRUE_$jumpCounter
         |D;$op
         |$accessTopOfStack
         |M=$FALSE
         |@CMP_END_$jumpCounter
         |0;JMP
         |
         |(CMP_TRUE_$jumpCounter)
         |$accessTopOfStack
         |M=$TRUE
         |
         |(CMP_END_$jumpCounter)
         |$incrementStackPointer
         |""").stripMargin
  }

  /** Push a value from a memory segment onto the stack
   *
   * @param segment memory segment to push from (LCL, ARG, THIS, THAT, TEMP, pointer, temp, constant)
   * @param offset  memory offset inside the segment to push
   */
  private def cmdPush(segment: String, offset: Int): String = {
    def pushMemoryValue(segment: String, offset: Int, kind: String): String =
      s"""
         |${accessNamedSegmentLocation(segment, offset, kind)}
         |D=M
         |$accessTopOfStack
         |M=D
         |$incrementStackPointer
         |""".stripMargin

    def pushStatic(num: Int): String =
      s"""
         |@Xxx.$num
         |D=M
         |$accessTopOfStack
         |M=D
         |$incrementStackPointer
         |""".stripMargin

    def pushConstant(num: Int): String =
      s"""
         |@$num
         |D=A
         |$accessTopOfStack
         |M=D
         |$incrementStackPointer
         |""".stripMargin

    segment match {
      case "LCL" | "ARG" | "THIS" | "THAT" => pushMemoryValue(segment, offset, "indirect")
      case "local" => pushMemoryValue("LCL", offset, "indirect")
      case "argument" => pushMemoryValue("ARG", offset, "indirect")
      case "this" => pushMemoryValue("THIS", offset, "indirect")
      case "that" => pushMemoryValue("THAT", offset, "indirect")
      case "pointer" => pushMemoryValue("3", offset, "direct")
      case "temp" => pushMemoryValue("5", offset, "direct")
      case "static" => pushStatic(offset)
      case "constant" => pushConstant(offset)
    }
  }

  /** Pop a value off the Stack into the specified memory segment
   *
   * @param segment the memory segment to push into (LCL, ARG, THIS, THAT, TEMP, pointer, temp, constant)
   * @param offset  the location in the memory segment
   * @return ML to complete the operation
   */
  private def cmdPop(segment: String, offset: Int): String = {
    def popMemoryValue(segment: String, offset: Int, kind: String): String =
      s"""
         |${accessNamedSegmentLocation(segment, offset, kind)}
         |D=A
         |@$REG_13 // store computed address
         |M=D  // in REG_13
         |
         |$decrementStackPointer
         |$accessTopOfStack
         |D=M
         |
         |@$REG_13 // store D into
         |A=M  // address saved in
         |M=D  // REG_13
         |""".stripMargin

    def popStatic(num: Int): String =
      s"""
         |$decrementStackPointer
         |$accessTopOfStack
         |D=M
         |
         |@Xxx.$num
         |M=D
         |""".stripMargin

    segment match {
      case "LCL" | "ARG" | "THIS" | "THAT" => popMemoryValue(segment, offset, "indirect")
      case "local" => popMemoryValue("LCL", offset, "indirect")
      case "argument" => popMemoryValue("ARG", offset, "indirect")
      case "this" => popMemoryValue("THIS", offset, "indirect")
      case "that" => popMemoryValue("THAT", offset, "indirect")
      case "pointer" => popMemoryValue("3", offset, "direct")
      case "temp" => popMemoryValue("5", offset, "direct")
      case "static" => popStatic(offset)
    }
  }

  /** Create a label with the given name, label
   *
   * @param label name of the label to create
   * @return ML that creates a new Label
   */
  def cmdLabel(label: String): String = {
    s"""
       |(${makeLabel(label)})
       |""".stripMargin
  }

  /** Create a Goto statement that unconditionally jumps to a given label
   *
   * @param label the name of the label to jump to
   * @return ML defining an unconditional jump
   */
  def cmdGoto(label: String): String = {
    s"""
       |@${makeLabel(label)}
       |0;JMP
       |""".stripMargin
  }

  /** Create a conditional Goto statement
   *
   * The condition for jumping is the previous stack entry. If 0, don't jump. Anything else, jump.
   *
   * @param label name of the label to jump to
   * @return ML defining a conditional jump
   */
  def cmdIfGoto(label: String): String = {
    s"""
       |$decrementStackPointer
       |$accessTopOfStack
       |D=M
       |@${makeLabel(label)}
       |D;JNE
       |""".stripMargin
  }

  /** Create a function entrypoint
   *
   * @param name     the name of the function
   * @param varCount number of local variables for the function
   * @return ML representing the start of a function
   */
  def cmdFunction(name: String, varCount: Int): String = {
    val initializeLocals = for (i <- 0 until varCount) yield
      s"""
         |${pushValueToStack("0")}
         |""".stripMargin

    s"""
       |($name)
       |${initializeLocals.mkString("\n")}
       |""".stripMargin
  }

  /** Create a function call
   *
   * @param name     the name of the function to call
   * @param argCount the number of arguments to pass to the function
   * @return ML implementing a function call
   */
  def cmdCall(name: String, argCount: Int): String = {
    jumpCounter += 1
    val returnLabel = makeLabel(jumpCounter.toString)

    s"""
       |${pushValueToStack(returnLabel)}
       |${pushSegmentToStack("LCL")}
       |${pushSegmentToStack("ARG")}
       |${pushSegmentToStack("THIS")}
       |${pushSegmentToStack("THAT")}
       |
       |// ARG = SP-n-5
       |@SP
       |D=M
       |@$argCount
       |D=D-A
       |@5
       |D=D-A
       |@ARG
       |M=D
       |
       |// LCL = SP
       |@SP
       |D=M
       |@LCL
       |M=D
       |
       |// goto f
       |@$name
       |0;JMP
       |
       |($returnLabel)
       |""".stripMargin
  }

  /** Generate a function's return */
  def cmdReturn(): String = {
    s"""
       |// FRAME = LCL
       |@LCL
       |D=M
       |@$REG_FRAME
       |M=D
       |
       |// RET = *(FRAME-5)
       |@5
       |A=D-A
       |D=M
       |@$REG_RETURN
       |M=D
       |
       |// *ARG = pop()
       |$popStackToD
       |@ARG
       |A=M
       |M=D
       |
       |// SP = ARG+1
       |@ARG
       |D=M
       |@SP
       |M=D+1
       |
       |// THAT = *(FRAME-1)
       |${indirectValueToD("FRAME", 1)}
       |@THAT
       |M=D
       |
       |// THIS = *(FRAME-2)
       |${indirectValueToD("FRAME", 2)}
       |@THIS
       |M=D
       |
       |// ARG = *(FRAME-3)
       |${indirectValueToD("FRAME", 3)}
       |@ARG
       |M=D
       |
       |// LCL = *(FRAME-4)
       |${indirectValueToD("FRAME", 4)}
       |@LCL
       |M=D
       |
       |// goto RET
       |@$REG_RETURN
       |A=M
       |0;JMP
       |""".stripMargin
  }


  /** Make a label name */
  def makeLabel(label: String): String = s"$namespace.$function$$$label"

  /** Make a label that defines a function start */
  def makeFunctionLabel(label: String): String = s"$namespace.$label"

  /** Point M to a named section of Memory
   *
   * @param segment the memory segment to access
   * @param offset  the offset inside of the segment to access
   * @param kind    the kind of memory access (direct, indirect)
   * @return ML to point "M" to the desired location
   */
  def accessNamedSegmentLocation(segment: String, offset: Int, kind: String): String = {
    val k = kind match {
      case "direct" => "A"
      case "indirect" => "M"
      case _ => throw new RuntimeException("unknown memory access kind: " + kind)
    }
    s"""
       |@$segment // accessing memory segment
       |D=$k
       |@$offset
       |A=D+A
       |""".stripMargin
  }

  /** push an integer onto the stack */
  def pushValueToStack(value: String): String =
    s"""
       |@$value
       |D=A
       |$accessTopOfStack
       |M=D
       |$incrementStackPointer
       |""".stripMargin

  /** Push a memory segment onto the stack
   *
   * Call with "LCL" to save the value of @LCL onto the stack, etc.
   *
   * @param segment the value to push onto the stack
   * @return ML for pushing a literal value onto the stack
   */
  def pushSegmentToStack(segment: String): String =
    s"""
       |@$segment
       |D=M
       |$accessTopOfStack
       |M=D
       |$incrementStackPointer
       |""".stripMargin

  /** Load the indirect value from address into the D register
   *
   * This function performs: `D=*(address-offset)`
   *
   * @param address the address to use as a pointer, can be a label
   * @param offset  pointer decrement you want to preform before access, e.g. *(address-1)
   * @return ML representing a pointer access
   */
  def indirectValueToD(address: String, offset: Int): String =
    s"""
       |@$REG_FRAME
       |D=M
       |@$offset
       |A=D-A // subtract offset
       |D=M   // load pointer value into D
       |""".stripMargin

  /** decrement the stack pointer */
  private val decrementStackPointer: String =
    """
      |@SP
      |M=M-1
      |""".stripMargin

  /** increment the stack pointer */
  private val incrementStackPointer: String =
    """
      |@SP
      |M=M+1
      |""".stripMargin

  /** load the current pointer's value into D */
  private val loadPointerValue: String =
    """
      |A=M
      |D=M
      |""".stripMargin

  /** pop the top of the stack into D */
  private val popStackToD: String =
    s"""
       |// pop stack into D
       |$decrementStackPointer
       |$loadPointerValue
       |""".stripMargin

  /** get M to point to the top of the stack */
  private val accessTopOfStack: String =
    """
      |@SP
      |A=M
      |""".stripMargin
}
