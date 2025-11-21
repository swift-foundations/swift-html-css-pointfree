import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Document Body Element Tests")
    struct BodyTests {
        @Test("Basic body renders correctly")
        func basicBodyRendersCorrectly() {
            assertInlineSnapshot(
                of: Body {
                    HTMLText("Hello, World!")
                },
                as: .html
            ) {
                """

                <body>Hello, World!
                </body>
                """
            }
        }

        @Test("Empty body renders correctly")
        func emptyBodyRendersCorrectly() {
            assertInlineSnapshot(
                of: Body {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <body>
                </body>
                """
            }
        }

        @Test("Body with nested elements renders correctly")
        func bodyWithNestedElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: Body {
                    Header {
                        H1 {
                            HTMLText("Main Title")
                        }
                    }
                    Main {
                        Paragraph {
                            HTMLText("Main content goes here.")
                        }
                    }
                    Footer {
                        HTMLText("Footer content")
                    }
                },
                as: .html
            ) {
                """

                <body>
                  <header>
                    <h1>Main Title
                    </h1>
                  </header>
                  <main>
                    <p>Main content goes here.
                    </p>
                  </main>
                  <footer>Footer content
                  </footer>
                </body>
                """
            }
        }

        @Test("Body with attributes renders correctly")
        func bodyWithAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Body {
                    ContentDivision {
                        HTMLText("Content")
                    }
                }
                .attribute("onload", "initialize()")
                .attribute("class", "main-body"),
                as: .html
            ) {
                """

                <body onload="initialize()" class="main-body">
                  <div>Content
                  </div>
                </body>
                """
            }
        }
    }
}
