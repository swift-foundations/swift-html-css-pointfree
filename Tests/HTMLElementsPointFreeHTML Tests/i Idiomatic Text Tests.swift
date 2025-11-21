import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct IdiomaticTextTests {
        @Test("Basic i element renders correctly")
        func basicIElementRendersCorrectly() {
            assertInlineSnapshot(
                of: IdiomaticText {
                    HTMLText("Italic text")
                },
                as: .html
            ) {
                """
                <i>Italic text</i>
                """
            }
        }

        @Test("I element for foreign words renders correctly")
        func iElementForForeignWordsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The word ")
                    IdiomaticText {
                        HTMLText("schadenfreude")
                    }
                    HTMLText(" is German.")
                },
                as: .html
            ) {
                """

                <p>The word <i>schadenfreude</i> is German.
                </p>
                """
            }
        }

        @Test("I element for technical terms renders correctly")
        func iElementForTechnicalTermsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The species ")
                    IdiomaticText {
                        HTMLText("Homo sapiens")
                    }
                    HTMLText(" evolved approximately 300,000 years ago.")
                },
                as: .html
            ) {
                """

                <p>The species <i>Homo sapiens</i> evolved approximately 300,000 years ago.
                </p>
                """
            }
        }

        @Test("I element with nested content renders correctly")
        func iElementWithNestedContentRendersCorrectly() {
            assertInlineSnapshot(
                of: IdiomaticText {
                    HTMLText("Italic with ")
                    StrongImportance {
                        HTMLText("strong")
                    }
                    HTMLText(" text")
                },
                as: .html
            ) {
                """
                <i>Italic with <strong>strong</strong> text</i>
                """
            }
        }

        @Test("IdiomaticText within HTMLDocument renders correctly")
        func idiomaticTextWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Paragraph {
                            HTMLText("The term ")
                            IdiomaticText {
                                HTMLText("vis-à-vis")
                            }
                            HTMLText(" means 'in relation to' or 'compared with'.")
                        }
                        Paragraph {
                            HTMLText("In mathematics, ")
                            IdiomaticText {
                                HTMLText("e")
                            }
                            HTMLText(" represents Euler's number.")
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
                <div>
                  <p>The term <i>vis-à-vis</i> means 'in relation to' or 'compared with'.
                  </p>
                  <p>In mathematics, <i>e</i> represents Euler's number.
                  </p>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
