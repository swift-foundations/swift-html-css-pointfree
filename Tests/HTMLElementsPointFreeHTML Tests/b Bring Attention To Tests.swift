import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("B Element Tests")
    struct BTests {
        @Test("Basic b element renders correctly")
        func basicBElementRendersCorrectly() {
            assertInlineSnapshot(
                of: B {
                    HTMLText("Important")
                },
                as: .html
            ) {
                """
                <b>Important</b>
                """
            }
        }

        @Test("B element within text renders correctly")
        func bElementWithinTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This is ")
                    B {
                        HTMLText("bold text")
                    }
                    HTMLText(" in a paragraph.")
                },
                as: .html
            ) {
                """

                <p>This is <b>bold text</b> in a paragraph.
                </p>
                """
            }
        }

        @Test("Nested b elements render correctly")
        func nestedBElementsRenderCorrectly() {
            assertInlineSnapshot(
                of: B {
                    HTMLText("Bold ")
                    Emphasis {
                        HTMLText("and emphasized")
                    }
                    HTMLText(" text")
                },
                as: .html
            ) {
                """
                <b>Bold <em>and emphasized</em> text</b>
                """
            }
        }

        @Test("B element within HTMLDocument renders correctly")
        func bElementWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        B {
                            HTMLText("Warning: ")
                        }
                        HTMLText("This action cannot be undone.")
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
                <div><b>Warning: </b>This action cannot be undone.
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
