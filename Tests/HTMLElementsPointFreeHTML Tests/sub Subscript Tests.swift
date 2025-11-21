import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Subscript Element Tests")
    struct SubscriptTests {
        @Test("Basic sub renders correctly")
        func basicSubRendersCorrectly() {
            assertInlineSnapshot(
                of: Subscript {
                    HTMLText("2")
                },
                as: .html
            ) {
                """
                <sub>2</sub>
                """
            }
        }

        @Test("Sub in chemical formula renders correctly")
        func subInChemicalFormulaRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Water has the chemical formula H")
                    Subscript {
                        HTMLText("2")
                    }
                    HTMLText("O.")
                },
                as: .html
            ) {
                """

                <p>Water has the chemical formula H<sub>2</sub>O.
                </p>
                """
            }
        }

        @Test("Sub in mathematical expression renders correctly")
        func subInMathematicalExpressionRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The sequence a")
                    Subscript {
                        HTMLText("n")
                    }
                    HTMLText(" = 2")
                    Superscript {
                        HTMLText("n")
                    }
                    HTMLText(" represents powers of 2.")
                },
                as: .html
            ) {
                """

                <p>The sequence a<sub>n</sub> = 2<sup>n</sup> represents powers of 2.
                </p>
                """
            }
        }

        @Test("Multiple subscripts render correctly")
        func multipleSubscriptsRenderCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Glucose: C")
                    Subscript {
                        HTMLText("6")
                    }
                    HTMLText("H")
                    Subscript {
                        HTMLText("12")
                    }
                    HTMLText("O")
                    Subscript {
                        HTMLText("6")
                    }
                },
                as: .html
            ) {
                """

                <p>Glucose: C<sub>6</sub>H<sub>12</sub>O<sub>6</sub>
                </p>
                """
            }
        }

        @Test("Subscript within HTMLDocument renders correctly")
        func subscriptWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Chemistry Basics")
                        }
                        Paragraph {
                            HTMLText("Carbon dioxide (CO")
                            Subscript {
                                HTMLText("2")
                            }
                            HTMLText(") is a greenhouse gas.")
                        }
                        Paragraph {
                            HTMLText("The base-10 logarithm: log")
                            Subscript {
                                HTMLText("10")
                            }
                            HTMLText("(100) = 2")
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
                  <h2>Chemistry Basics
                  </h2>
                  <p>Carbon dioxide (CO<sub>2</sub>) is a greenhouse gas.
                  </p>
                  <p>The base-10 logarithm: log<sub>10</sub>(100) = 2
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
