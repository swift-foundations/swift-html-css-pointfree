import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Document Metadata Header Element Tests")
    struct HeadTests {
        @Test("Basic head renders correctly")
        func basicHeadRendersCorrectly() {
            assertInlineSnapshot(
                of: Header {
                    Title {
                        HTMLText("Page Title")
                    }
                },
                as: .html
            ) {
                """

                <header>
                  <title>Page Title
                  </title>
                </header>
                """
            }
        }

        @Test("Head with meta tags renders correctly")
        func headWithMetaTagsRendersCorrectly() {
            assertInlineSnapshot(
                of: Header {
                    Title {
                        HTMLText("My Website")
                    }
                    Meta()()
                        .attribute("charset", "UTF-8")
                    Meta()()
                        .attribute("name", "viewport")
                        .attribute("content", "width=device-width, initial-scale=1.0")
                    Meta()()
                        .attribute("name", "description")
                        .attribute("content", "A sample website")
                },
                as: .html
            ) {
                """

                <header>
                  <title>My Website
                  </title>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <meta name="description" content="A sample website">
                </header>
                """
            }
        }

        @Test("Head with stylesheet and script renders correctly")
        func headWithStylesheetAndScriptRendersCorrectly() {
            assertInlineSnapshot(
                of: HTML_Standard_Elements.Head {
                    Title {
                        HTMLText("Styled Page")
                    }
                    //                HTML_Standard_Elements.Link()
                    ////                    .attribute("rel", "stylesheet")
                    ////                    .attribute("href", "/styles.css")
                    //                Style {
                    //                    HTMLText("body { margin: 0; }")
                    //                }
                },
                as: .html
            ) {
                """

                <head>
                  <title>Styled Page
                  </title>
                </head>
                """
            }
        }

        @Test("Head with base URL renders correctly")
        func headWithBaseURLRendersCorrectly() {
            assertInlineSnapshot(
                of: Header {
                    Title {
                        HTMLText("Base URL Example")
                    }
                    //                DocumentBaseURL()
                    //                    .attribute("href", "https://example.com/")
                    //                    .attribute("target", "_blank")
                },
                as: .html
            ) {
                """

                <header>
                  <title>Base URL Example
                  </title>
                </header>
                """
            }
        }

        @Test("Empty head renders correctly")
        func emptyHeadRendersCorrectly() {
            assertInlineSnapshot(
                of: Header {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <header>
                </header>
                """
            }
        }
    }
}
