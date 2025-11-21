import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Superscript Element Tests")
    struct SuperscriptTests {
        @Test("Basic sup renders correctly")
        func basicSupRendersCorrectly() {
            assertInlineSnapshot(
                of: Superscript {
                    HTMLText("2")
                },
                as: .html
            ) {
                """
                <sup>2</sup>
                """
            }
        }

        @Test("Sup in mathematical expression renders correctly")
        func supInMathematicalExpressionRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Einstein's famous equation: E = mc")
                    Superscript {
                        HTMLText("2")
                    }
                },
                as: .html
            ) {
                """

                <p>Einstein's famous equation: E = mc<sup>2</sup>
                </p>
                """
            }
        }

        @Test("Sup for ordinal numbers renders correctly")
        func supForOrdinalNumbersRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This happened on the 21")
                    Superscript {
                        HTMLText("st")
                    }
                    HTMLText(" of March, not the 22")
                    Superscript {
                        HTMLText("nd")
                    }
                    HTMLText(".")
                },
                as: .html
            ) {
                """

                <p>This happened on the 21<sup>st</sup> of March, not the 22<sup>nd</sup>.
                </p>
                """
            }
        }

        @Test("Sup with complex expressions renders correctly")
        func supWithComplexExpressionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The area formula: (x + y)")
                    Superscript {
                        HTMLText("2")
                    }
                    HTMLText(" = x")
                    Superscript {
                        HTMLText("2")
                    }
                    HTMLText(" + 2xy + y")
                    Superscript {
                        HTMLText("2")
                    }
                },
                as: .html
            ) {
                """

                <p>The area formula: (x + y)<sup>2</sup> = x<sup>2</sup> + 2xy + y<sup>2</sup>
                </p>
                """
            }
        }

        @Test("Sup for footnote references renders correctly")
        func supForFootnoteReferencesRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This statement needs verification")
                    Superscript {
                        Anchor(href: "#footnote1") {
                            HTMLText("1")
                        }
                    }
                    HTMLText(" and further research")
                    Superscript {
                        Anchor(href: "#footnote2") {
                            HTMLText("2")
                        }
                    }
                    HTMLText(".")
                },
                as: .html
            ) {
                """

                <p>This statement needs verification<sup><a href="#footnote1">1</a></sup> and further research<sup><a href="#footnote2">2</a></sup>.
                </p>
                """
            }
        }

        @Test("Superscript within HTMLDocument renders correctly")
        func superscriptWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Mathematics")
                        }
                        Paragraph {
                            HTMLText("The Pythagorean theorem: a")
                            Superscript {
                                HTMLText("2")
                            }
                            HTMLText(" + b")
                            Superscript {
                                HTMLText("2")
                            }
                            HTMLText(" = c")
                            Superscript {
                                HTMLText("2")
                            }
                        }
                        Paragraph {
                            HTMLText("Temperature: 25°C (77°F)")
                            Superscript {
                                HTMLText("*")
                            }
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
                  <h2>Mathematics
                  </h2>
                  <p>The Pythagorean theorem: a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>
                  </p>
                  <p>Temperature: 25°C (77°F)<sup>*</sup>
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
