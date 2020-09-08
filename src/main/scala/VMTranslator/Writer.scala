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

  private var jumpCounter = 0 // keep track of the number of jumps so that we can generate unique labels

  /** Render the list of [[Command]]s into a String of Machine Code
   *
   * @return Machine code representing the input [[Command]] list
   */
  def render(): String = {
    commands.map(cmd => {
      val comment = s"// $cmd"
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

  def pushConstant(num: Int): String =
    s"""
       |@$num
       |D=A
       |$accessTopOfStack
       |M=D
       |$incrementStackPointer
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

  /** get M to point to the top of the stack */
  private val accessTopOfStack: String =
    """
      |@SP
      |A=M
      |""".stripMargin
}
