import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("UnorderedList Element Tests")
    struct UnorderedListTests {
        @Test("Basic ul renders correctly")
        func basicUlRendersCorrectly() {
            assertInlineSnapshot(
                of: UnorderedList {
                    ListItem {
                        HTMLText("First item")
                    }
                    ListItem {
                        HTMLText("Second item")
                    }
                },
                as: .html
            ) {
                """

                <ul>
                  <li>First item
                  </li>
                  <li>Second item
                  </li>
                </ul>
                """
            }
        }

        @Test("Empty ul renders correctly")
        func emptyUlRendersCorrectly() {
            assertInlineSnapshot(
                of: UnorderedList {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <ul>
                </ul>
                """
            }
        }

        @Test("Nested ul renders correctly")
        func nestedUlRendersCorrectly() {
            assertInlineSnapshot(
                of: UnorderedList {
                    ListItem {
                        HTMLText("Top level item")
                        UnorderedList {
                            ListItem {
                                HTMLText("Nested item 1")
                            }
                            ListItem {
                                HTMLText("Nested item 2")
                            }
                        }
                    }
                    ListItem {
                        HTMLText("Another top level item")
                    }
                },
                as: .html
            ) {
                """

                <ul>
                  <li>Top level item
                    <ul>
                      <li>Nested item 1
                      </li>
                      <li>Nested item 2
                      </li>
                    </ul>
                  </li>
                  <li>Another top level item
                  </li>
                </ul>
                """
            }
        }

        @Test("Ul with inline content in items renders correctly")
        func ulWithInlineContentInItemsRendersCorrectly() {
            assertInlineSnapshot(
                of: UnorderedList {
                    ListItem {
                        StrongImportance {
                            HTMLText("Important:")
                        }
                        HTMLText(" This is a key point")
                    }
                    ListItem {
                        HTMLText("Regular item with ")
                        Anchor(
                            href: "https://example.com"
                        ) {
                            HTMLText("a link")
                        }
                    }
                },
                as: .html
            ) {
                """

                <ul>
                  <li><strong>Important:</strong> This is a key point
                  </li>
                  <li>Regular item with <a href="https://example.com">a link</a>
                  </li>
                </ul>
                """
            }
        }

        @Test("UnorderedList within HTMLDocument renders correctly")
        func unorderedListWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        H2 {
                            HTMLText("Features")
                        }
                        UnorderedList {
                            ListItem {
                                HTMLText("Fast performance")
                            }
                            ListItem {
                                HTMLText("Easy to use")
                            }
                            ListItem {
                                HTMLText("Open source")
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
                <div>
                  <h2>Features
                  </h2>
                  <ul>
                    <li>Fast performance
                    </li>
                    <li>Easy to use
                    </li>
                    <li>Open source
                    </li>
                  </ul>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
