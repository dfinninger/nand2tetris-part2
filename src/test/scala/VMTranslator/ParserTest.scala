package VMTranslator

import org.scalatest.funsuite.AnyFunSuite

class ParserTest extends AnyFunSuite {

  test("should ignore an empty file") {
    val input = List()
    val expected = List()
    val result = Parser.parse(input, List())

    assert(expected == result)
  }

  test("should ignore comments and empty lines") {
    val input = List("", "     ", "// a comment")
    val expected = List()
    val result = Parser.parse(input, List())

    assert(expected == result)
  }

  test("should choose correct type for each command") {
    val input = List("add", "sub", "neg", "eq", "gt", "lt", "and", "or", "not", "push foo 3", "pop bar 2")
    val expected = List(
      Arithmetic("add"),
      Arithmetic("sub"),
      Arithmetic("neg"),
      Arithmetic("eq"),
      Arithmetic("gt"),
      Arithmetic("lt"),
      Arithmetic("and"),
      Arithmetic("or"),
      Arithmetic("not"),
      Push("foo", 3),
      Pop("bar", 2)
    )
    val result = Parser.parse(input, List())

    assert(expected === result)
  }
}
