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
