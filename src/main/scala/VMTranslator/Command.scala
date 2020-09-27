package VMTranslator

/** Base Class for all Commands */
sealed abstract class Command

/** Container for Arithmetic commands
 *
 * Arithmetic kinds:
 *   add, sub, neg, eq, gt, lt, and, or, not
 */
case class Arithmetic(kind: String) extends Command

/** Push an item onto a stack */
case class Push(stack: String, index: Int) extends Command

/** Pop an item from a stack */
case class Pop(stack: String, index: Int) extends Command

/** Create a new label */
case class Label(label: String) extends Command

/** Jump to a label */
case class Goto(label: String) extends Command

/** Conditionally jump to a label */
case class IfGoto(label: String) extends Command

/** Define a function start */
case class Function(name: String, argCount: Int) extends Command

/** Call a function */
case class Call(name: String, varCount: Int) extends Command

/** Return from a function */
case class Return() extends Command
