import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Emphasis Element Tests")
    struct EmphasisTests {
        @Test("Basic emphasis renders correctly")
        func basicEmphasisRendersCorrectly() {
            assertInlineSnapshot(
                of: Emphasis {
                    HTMLText("important")
                },
                as: .html
            ) {
                """
                <em>important</em>
                """
            }
        }

        @Test("Emphasis within text renders correctly")
        func emphasisWithinTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This is ")
                    Emphasis {
                        HTMLText("really")
                    }
                    HTMLText(" important information.")
                },
                as: .html
            ) {
                """

                <p>This is <em>really</em> important information.
                </p>
                """
            }
        }

        @Test("Nested emphasis and strong renders correctly")
        func nestedEmphasisAndStrongRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This is ")
                    Emphasis {
                        HTMLText("emphasized and ")
                        StrongImportance {
                            HTMLText("strong")
                        }
                    }
                    HTMLText(" text.")
                },
                as: .html
            ) {
                """

                <p>This is <em>emphasized and <strong>strong</strong></em> text.
                </p>
                """
            }
        }

        @Test("Multiple emphasis elements render correctly")
        func multipleEmphasisElementsRenderCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    Emphasis {
                        HTMLText("First")
                    }
                    HTMLText(" and ")
                    Emphasis {
                        HTMLText("second")
                    }
                    HTMLText(" emphasis.")
                },
                as: .html
            ) {
                """

                <p><em>First</em> and <em>second</em> emphasis.
                </p>
                """
            }
        }

        @Test("Emphasis within HTMLDocument renders correctly")
        func emphasisWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        HTMLText("Please ")
                        Emphasis {
                            HTMLText("carefully")
                        }
                        HTMLText(" read the instructions.")
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
                <div>Please <em>carefully</em> read the instructions.
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
