package VMTranslator

import java.io.File
import java.nio.charset.StandardCharsets
import java.nio.file.{Files, Paths}
import java.util.Calendar

object VMTranslator extends App {
  private def printUsage(): Unit =
    println(
      """
        |== VMTranslator ==
        |Translates a Jack VM file into Hack Assembly
        |
        |usage: scala VMTranslator.jar <input file/dir>""".stripMargin)

  if (args.length != 1) {
    printUsage()
    System.exit(1)
  }

  val input = new File(args(0))
  val inputFiles = if (input.isDirectory) {
    input.listFiles.filter(_.getName.endsWith(".vm")).toList
  } else {
    List[File](input)
  }

  val writers = for (file <- inputFiles) yield {
    val namespace = file.getName.replaceAll("\\.vm", "")
    val commands = Parser.parse(file.getPath)

    new Writer(commands, namespace)
  }

  var output = s"// ${Calendar.getInstance().getTime}\n" + writers.map(_.render()).mkString("\n")
  if (inputFiles.exists { f => f.getName == "Sys.vm"})
    output = writers.head.initialization() + output


  val outFile = if (input.isDirectory)
    input.getPath + "/" + input.getName.replace(".vm", "") + ".asm"
  else
    input.getParent + "/" + input.getName.replace(".vm", "") + ".asm"

  println("writing to " + outFile)
  Files.write(Paths.get(outFile), output.getBytes(StandardCharsets.UTF_8))
}
