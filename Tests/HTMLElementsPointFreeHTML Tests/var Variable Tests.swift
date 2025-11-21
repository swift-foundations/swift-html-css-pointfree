import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Variable Element Tests")
    struct VariableTests {
        @Test("Basic var renders correctly")
        func basicVarRendersCorrectly() {
            assertInlineSnapshot(
                of: Variable {
                    HTMLText("x")
                },
                as: .html
            ) {
                """
                <var>x</var>
                """
            }
        }

        @Test("Var in mathematical expressions renders correctly")
        func varInMathematicalExpressionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("If ")
                    Variable {
                        HTMLText("x")
                    }
                    HTMLText(" = 5 and ")
                    Variable {
                        HTMLText("y")
                    }
                    HTMLText(" = 3, then ")
                    Variable {
                        HTMLText("x")
                    }
                    HTMLText(" + ")
                    Variable {
                        HTMLText("y")
                    }
                    HTMLText(" = 8.")
                },
                as: .html
            ) {
                """

                <p>If <var>x</var> = 5 and <var>y</var> = 3, then <var>x</var> + <var>y</var> = 8.
                </p>
                """
            }
        }

        @Test("Var in programming context renders correctly")
        func varInProgrammingContextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The function takes a parameter ")
                    Variable {
                        HTMLText("username")
                    }
                    HTMLText(" and returns the length of ")
                    Variable {
                        HTMLText("username")
                    }
                    HTMLText(".")
                },
                as: .html
            ) {
                """

                <p>The function takes a parameter <var>username</var> and returns the length of <var>username</var>.
                </p>
                """
            }
        }

        @Test("Var with complex variable names renders correctly")
        func varWithComplexVariableNamesRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The equation ")
                    Variable {
                        HTMLText("totalAmount")
                    }
                    HTMLText(" = ")
                    Variable {
                        HTMLText("basePrice")
                    }
                    HTMLText(" × ")
                    Variable {
                        HTMLText("quantity")
                    }
                    HTMLText(" calculates the total.")
                },
                as: .html
            ) {
                """

                <p>The equation <var>totalAmount</var> = <var>basePrice</var> × <var>quantity</var> calculates the total.
                </p>
                """
            }
        }

        @Test("Var in code documentation renders correctly")
        func varInCodeDocumentationRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    PreformattedText {
                        Code {
                            HTMLText("function calculate(")
                            Variable {
                                HTMLText("a")
                            }
                            HTMLText(", ")
                            Variable {
                                HTMLText("b")
                            }
                            HTMLText(") {\n  return ")
                            Variable {
                                HTMLText("a")
                            }
                            HTMLText(" * ")
                            Variable {
                                HTMLText("b")
                            }
                            HTMLText(";\n}")
                        }
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <pre><code>function calculate(<var>a</var>, <var>b</var>) {
                  return <var>a</var> * <var>b</var>;
                }</code></pre>
                </div>
                """
            }
        }

        @Test("Variable within HTMLDocument renders correctly")
        func variableWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Algorithm Analysis")
                        }
                        Paragraph {
                            HTMLText("The time complexity is O(")
                            Variable {
                                HTMLText("n")
                            }
                            HTMLText(" log ")
                            Variable {
                                HTMLText("n")
                            }
                            HTMLText(") where ")
                            Variable {
                                HTMLText("n")
                            }
                            HTMLText(" is the input size.")
                        }
                        Paragraph {
                            HTMLText("Space complexity: O(")
                            Variable {
                                HTMLText("k")
                            }
                            HTMLText(") where ")
                            Variable {
                                HTMLText("k")
                            }
                            HTMLText(" is the number of unique elements.")
                        }
                    }
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>

                    </style>
                  </head>
                  <body>
                <article>
                  <h2>Algorithm Analysis
                  </h2>
                  <p>The time complexity is O(<var>n</var> log <var>n</var>) where <var>n</var> is the input size.
                  </p>
                  <p>Space complexity: O(<var>k</var>) where <var>k</var> is the number of unique elements.
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
