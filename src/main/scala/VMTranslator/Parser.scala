package VMTranslator

import jdk.nashorn.internal.ir.ReturnNode

import scala.annotation.tailrec
import scala.io.Source

object Parser {

  /** Read the lines of the input file and parse them into a List */
  private def readInputFile(inputFile: String): List[String] = {
    val fileSource = Source.fromFile(inputFile)
    try {
      fileSource.getLines.toList
    } finally {
      fileSource.close()
    }
  }

  /** Parse the given file into a list of of [[Command]]
   *
   * @param inputFile the filename of a ".vm" file
   * @return List of parsed [[Command]] objects
   */
  def parse(inputFile: String): List[Command] = {
    val lines = readInputFile(inputFile)
    val commands = List[Command]()
    parse(lines, commands)
  }

  /** Parse the list of strings into a list of commands
   *
   * This is most commonly called by the other `parse` method that takes a filename.
   *
   * @param lines    list of string that comprise the lines of an input file
   * @param commands the currently-accumulated list of commands (empty list for a new parse)
   * @return a list of commands generated from the initial input `lines` list
   */
  @tailrec
  def parse(lines: List[String], commands: List[Command]): List[Command] = {
    // Finish execution if the input list is empty
    // We've been appending the commands to the head of the list, so reversing the list will put the items "in order"
    if (lines.isEmpty) commands.reverse
    else {
      val head :: tail = lines
      val trimHead = head.trim

      // Skip empty and commented lines
      if (trimHead == "" || trimHead.startsWith("//")) parse(tail, commands)
      else {
        // The first word of a line is the command, the rest being arguments to the command
        val parts = for (item <- trimHead.split(" ")) yield item.trim
        val newCommand = parts(0) match {
          case "push" => Push(parts(1), parts(2).toInt)
          case "pop" => Pop(parts(1), parts(2).toInt)
          case "add" | "sub" | "neg" | "eq" | "gt" | "lt" | "and" | "or" | "not" => Arithmetic(parts(0))
          case "label" => Label(parts(1))
          case "goto" => Goto(parts(1))
          case "if-goto" => IfGoto(parts(1))
          case "function" => Function(parts(1), parts(2).toInt)
          case "call" => Call(parts(1), parts(2).toInt)
          case "return" => Return()
          case _ => throw new RuntimeException(s"Unknown command: ${parts(0)}")
        }

        parse(tail, newCommand :: commands)
      }
    }
  }
}
