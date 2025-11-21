import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct DocumentTitleTests {
        @Test("Basic title renders correctly")
        func basicTitleRendersCorrectly() {
            assertInlineSnapshot(
                of: Title {
                    HTMLText("My Website")
                },
                as: .html
            ) {
                """

                <title>My Website
                </title>
                """
            }
        }

        @Test("Title with special characters renders correctly")
        func titleWithSpecialCharactersRendersCorrectly() {
            assertInlineSnapshot(
                of: Title {
                    HTMLText("Welcome to the Future | Tech Blog & News")
                },
                as: .html
            ) {
                """

                <title>Welcome to the Future | Tech Blog &amp; News
                </title>
                """
            }
        }

        @Test("Title within head element renders correctly")
        func titleWithinHeadElementRendersCorrectly() {
            assertInlineSnapshot(
                of: HTML_Standard_Elements.Head {
                    Title {
                        HTMLText("Page Title")
                    }
                    Meta()()
                        .attribute("charset", "UTF-8")
                },
                as: .html
            ) {
                """

                <head>
                  <title>Page Title
                  </title>
                  <meta charset="UTF-8">
                </head>
                """
            }
        }

        @Test("Title with long text renders correctly")
        func titleWithLongTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Title {
                    HTMLText(
                        "This is a very long title that might wrap in browser tabs but should still render correctly in HTML"
                    )
                },
                as: .html
            ) {
                """

                <title>This is a very long title that might wrap in browser tabs but should still render correctly in HTML
                </title>
                """
            }
        }

        @Test("Title with mixed content renders correctly")
        func titleWithMixedContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Title {
                    HTMLText("Contact Us - ")
                    HTMLText("Company Name")
                    HTMLText(" ™")
                },
                as: .html
            ) {
                """

                <title>Contact Us - Company Name ™
                </title>
                """
            }
        }

        @Test("Title within HTMLDocument renders correctly")
        func titleWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    HTML_Standard_Elements.Head {
                        Title {
                            HTMLText("Document Title")
                        }
                    }
                    Body {
                        Header {
                            HTMLText("Welcome")
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
                <head>
                  <title>Document Title
                  </title>
                </head>
                <body>
                  <header>Welcome
                  </header>
                </body>
                  </body>
                </html>
                """
            }
        }

        @Test("Title with common web page patterns renders correctly")
        func titleWithCommonWebPagePatternsRendersCorrectly() {
            assertInlineSnapshot(
                of: Title {
                    HTMLText("Home - MyWebsite.com")
                },
                as: .html
            ) {
                """

                <title>Home - MyWebsite.com
                </title>
                """
            }
        }

        @Test("Title for e-commerce page renders correctly")
        func titleForEcommercePageRendersCorrectly() {
            assertInlineSnapshot(
                of: Title {
                    HTMLText("Apple iPhone 15 Pro | Buy Online | TechStore")
                },
                as: .html
            ) {
                """

                <title>Apple iPhone 15 Pro | Buy Online | TechStore
                </title>
                """
            }
        }
    }
}
