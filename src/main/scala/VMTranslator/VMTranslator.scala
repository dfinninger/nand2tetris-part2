package VMTranslator

import java.nio.charset.StandardCharsets
import java.nio.file.{Files, Paths}

object VMTranslator extends App {
  private def printUsage(): Unit =
    println(
      """
        |== VMTranslator ==
        |Translates a Jack VM file into Hack Assembly
        |
        |usage: scala VMTranslator.jar <inputfile>""".stripMargin)

  if (args.length != 1) {
    printUsage()
    System.exit(1)
  }

  val commands = Parser.parse(args(0))
  val writer = new Writer(commands)

  val outFile = args(0).replace(".vm", ".asm")
  Files.write(Paths.get(outFile), writer.render().getBytes(StandardCharsets.UTF_8))
}
