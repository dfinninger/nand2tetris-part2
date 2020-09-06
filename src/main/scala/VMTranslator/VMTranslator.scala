package VMTranslator

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
}
