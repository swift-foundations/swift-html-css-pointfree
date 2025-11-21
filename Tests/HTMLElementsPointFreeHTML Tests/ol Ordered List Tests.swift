import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct OrderedListTests {
        @Test("Basic ol renders correctly")
        func basicOlRendersCorrectly() {
            assertInlineSnapshot(
                of: OrderedList {
                    ListItem {
                        HTMLText("First item")
                    }
                    ListItem {
                        HTMLText("Second item")
                    }
                    ListItem {
                        HTMLText("Third item")
                    }
                },
                as: .html
            ) {
                """

                <ol>
                  <li>First item
                  </li>
                  <li>Second item
                  </li>
                  <li>Third item
                  </li>
                </ol>
                """
            }
        }

        @Test("Ol with start attribute renders correctly")
        func olWithStartAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: OrderedList(
                    start: 5
                ) {
                    ListItem {
                        HTMLText("Fifth item")
                    }
                    ListItem {
                        HTMLText("Sixth item")
                    }
                    ListItem {
                        HTMLText("Seventh item")
                    }
                },
                as: .html
            ) {
                """

                <ol start="5">
                  <li>Fifth item
                  </li>
                  <li>Sixth item
                  </li>
                  <li>Seventh item
                  </li>
                </ol>
                """
            }
        }

        @Test("Ol with type attribute renders correctly")
        func olWithTypeAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: OrderedList(
                    type: .upperRoman
                ) {
                    ListItem {
                        HTMLText("First chapter")
                    }
                    ListItem {
                        HTMLText("Second chapter")
                    }
                    ListItem {
                        HTMLText("Third chapter")
                    }
                },
                as: .html
            ) {
                """

                <ol type="I">
                  <li>First chapter
                  </li>
                  <li>Second chapter
                  </li>
                  <li>Third chapter
                  </li>
                </ol>
                """
            }
        }

        @Test("Ol with reversed attribute renders correctly")
        func olWithReversedAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: OrderedList(
                    reversed: true
                ) {
                    ListItem {
                        HTMLText("Last item")
                    }
                    ListItem {
                        HTMLText("Second to last")
                    }
                    ListItem {
                        HTMLText("Third to last")
                    }
                },
                as: .html
            ) {
                """

                <ol reversed>
                  <li>Last item
                  </li>
                  <li>Second to last
                  </li>
                  <li>Third to last
                  </li>
                </ol>
                """
            }
        }

        @Test("Nested ol renders correctly")
        func nestedOlRendersCorrectly() {
            assertInlineSnapshot(
                of: OrderedList {
                    ListItem {
                        HTMLText("Main topic 1")
                        OrderedList(
                            type: .lowerAlpha
                        ) {
                            ListItem {
                                HTMLText("Subtopic 1a")
                            }
                            ListItem {
                                HTMLText("Subtopic 1b")
                            }
                        }
                    }
                    ListItem {
                        HTMLText("Main topic 2")
                        OrderedList(
                            type: .lowerAlpha
                        ) {
                            ListItem {
                                HTMLText("Subtopic 2a")
                            }
                            ListItem {
                                HTMLText("Subtopic 2b")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <ol>
                  <li>Main topic 1
                    <ol type="a">
                      <li>Subtopic 1a
                      </li>
                      <li>Subtopic 1b
                      </li>
                    </ol>
                  </li>
                  <li>Main topic 2
                    <ol type="a">
                      <li>Subtopic 2a
                      </li>
                      <li>Subtopic 2b
                      </li>
                    </ol>
                  </li>
                </ol>
                """
            }
        }

        @Test("Ol with complex content renders correctly")
        func olWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: OrderedList {
                    ListItem {
                        StrongImportance {
                            HTMLText("Step 1:")
                        }
                        HTMLText(" Download the software from ")
                        Anchor(href: "https://example.com/download") {
                            HTMLText("our website")
                        }
                    }
                    ListItem {
                        StrongImportance {
                            HTMLText("Step 2:")
                        }
                        HTMLText(" Install the application")
                        UnorderedList {
                            ListItem {
                                HTMLText("Run the installer")
                            }
                            ListItem {
                                HTMLText("Follow the setup wizard")
                            }
                        }
                    }
                    ListItem {
                        StrongImportance {
                            HTMLText("Step 3:")
                        }
                        HTMLText(" Launch and configure")
                    }
                },
                as: .html
            ) {
                """

                <ol>
                  <li><strong>Step 1:</strong> Download the software from <a href="https://example.com/download">our website</a>
                  </li>
                  <li><strong>Step 2:</strong> Install the application
                    <ul>
                      <li>Run the installer
                      </li>
                      <li>Follow the setup wizard
                      </li>
                    </ul>
                  </li>
                  <li><strong>Step 3:</strong> Launch and configure
                  </li>
                </ol>
                """
            }
        }

        @Test("OrderedList within HTMLDocument renders correctly")
        func orderedListWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Installation Guide")
                        }
                        Paragraph {
                            HTMLText("Follow these steps to install the software:")
                        }
                        OrderedList(
                            type: .decimal
                        ) {
                            ListItem {
                                HTMLText("Download the installer package")
                            }
                            ListItem {
                                HTMLText("Run the installer as administrator")
                            }
                            ListItem {
                                HTMLText("Accept the license agreement")
                            }
                            ListItem {
                                HTMLText("Choose installation directory")
                            }
                            ListItem {
                                HTMLText("Complete the installation")
                            }
                        }
                        Paragraph {
                            HTMLText("After installation, restart your computer.")
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
                  <h2>Installation Guide
                  </h2>
                  <p>Follow these steps to install the software:
                  </p>
                  <ol type="1">
                    <li>Download the installer package
                    </li>
                    <li>Run the installer as administrator
                    </li>
                    <li>Accept the license agreement
                    </li>
                    <li>Choose installation directory
                    </li>
                    <li>Complete the installation
                    </li>
                  </ol>
                  <p>After installation, restart your computer.
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
