import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("ContentDivision Element Tests")
    struct ContentDivisionTests {
        @Test("Basic div renders correctly")
        func basicDivRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    HTMLText("Hello, World!")
                },
                as: .html
            ) {
                """

                <div>Hello, World!
                </div>
                """
            }
        }

        @Test("Empty div renders correctly")
        func emptyDivRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <div>
                </div>
                """
            }
        }

        @Test("DIV with nested elements renders correctly")
        func divWithNestedElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    H1 {
                        HTMLText("Title")
                    }
                    Paragraph {
                        HTMLText("This is a paragraph inside a div.")
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <h1>Title
                  </h1>
                  <p>This is a paragraph inside a div.
                  </p>
                </div>
                """
            }
        }

        @Test("Nested divs render correctly")
        func nestedDivsRenderCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    ContentDivision {
                        HTMLText("Inner div")
                    }
                    HTMLText("Outer div content")
                },
                as: .html
            ) {
                """

                <div>
                  <div>Inner div
                  </div>Outer div content
                </div>
                """
            }
        }

        @Test("ContentDivision within HTMLDocument renders correctly")
        func contentDivisionWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        ContentDivision {
                            HTMLText("Header")
                        }
                        ContentDivision {
                            HTMLText("Main content")
                        }
                        ContentDivision {
                            HTMLText("Footer")
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
                  <div>Header
                  </div>
                  <div>Main content
                  </div>
                  <div>Footer
                  </div>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
