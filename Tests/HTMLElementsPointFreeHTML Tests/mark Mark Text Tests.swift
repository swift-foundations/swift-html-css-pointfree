import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct MarkTests {
        @Test("Basic mark renders correctly")
        func basicMarkRendersCorrectly() {
            assertInlineSnapshot(
                of: Mark {
                    HTMLText("highlighted")
                },
                as: .html
            ) {
                """
                <mark>highlighted</mark>
                """
            }
        }

        @Test("Mark within text renders correctly")
        func markWithinTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Please review the ")
                    Mark {
                        HTMLText("updated section")
                    }
                    HTMLText(" carefully.")
                },
                as: .html
            ) {
                """

                <p>Please review the <mark>updated section</mark> carefully.
                </p>
                """
            }
        }

        @Test("Mark for search results renders correctly")
        func markForSearchResultsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Search results for '")
                    Mark {
                        HTMLText("swift")
                    }
                    HTMLText("': The ")
                    Mark {
                        HTMLText("Swift")
                    }
                    HTMLText(" programming language is powerful and intuitive.")
                },
                as: .html
            ) {
                """

                <p>Search results for '<mark>swift</mark>': The <mark>Swift</mark> programming language is powerful and intuitive.
                </p>
                """
            }
        }

        @Test("Mark with nested elements renders correctly")
        func markWithNestedElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: Mark {
                    StrongImportance {
                        HTMLText("Important")
                    }
                    HTMLText(" highlighted text")
                },
                as: .html
            ) {
                """
                <mark><strong>Important</strong> highlighted text</mark>
                """
            }
        }

        @Test("Mark within HTMLDocument renders correctly")
        func markWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        H2 {
                            HTMLText("Document Review")
                        }
                        Paragraph {
                            HTMLText("Changes were made to ")
                            Mark {
                                HTMLText("section 3.2")
                            }
                            HTMLText(" and ")
                            Mark {
                                HTMLText("appendix B")
                            }
                            HTMLText(".")
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
                  <h2>Document Review
                  </h2>
                  <p>Changes were made to <mark>section 3.2</mark> and <mark>appendix B</mark>.
                  </p>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
