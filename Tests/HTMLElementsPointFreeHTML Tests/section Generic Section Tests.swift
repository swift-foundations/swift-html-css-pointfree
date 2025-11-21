import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Section Element Tests")
    struct SectionTests {
        @Test("Basic section renders correctly")
        func basicSectionRendersCorrectly() {
            assertInlineSnapshot(
                of: Section {
                    H2 {
                        HTMLText("Section Title")
                    }
                    Paragraph {
                        HTMLText("Section content goes here.")
                    }
                },
                as: .html
            ) {
                """

                <section>
                  <h2>Section Title
                  </h2>
                  <p>Section content goes here.
                  </p>
                </section>
                """
            }
        }

        @Test("Section with multiple subsections renders correctly")
        func sectionWithMultipleSubsectionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Section {
                    H2 {
                        HTMLText("Main Section")
                    }
                    Section {
                        H3 {
                            HTMLText("Subsection 1")
                        }
                        Paragraph {
                            HTMLText("First subsection content.")
                        }
                    }
                    Section {
                        H3 {
                            HTMLText("Subsection 2")
                        }
                        Paragraph {
                            HTMLText("Second subsection content.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <section>
                  <h2>Main Section
                  </h2>
                  <section>
                    <h3>Subsection 1
                    </h3>
                    <p>First subsection content.
                    </p>
                  </section>
                  <section>
                    <h3>Subsection 2
                    </h3>
                    <p>Second subsection content.
                    </p>
                  </section>
                </section>
                """
            }
        }

        @Test("Section with header and footer renders correctly")
        func sectionWithHeaderAndFooterRendersCorrectly() {
            assertInlineSnapshot(
                of: Section {
                    Header {
                        H2 {
                            HTMLText("Chapter 1")
                        }
                        Paragraph {
                            HTMLText("Introduction to the topic")
                        }
                    }
                    Paragraph {
                        HTMLText("Main chapter content goes here.")
                    }
                    Footer {
                        Paragraph {
                            HTMLText("End of Chapter 1")
                        }
                    }
                },
                as: .html
            ) {
                """

                <section>
                  <header>
                    <h2>Chapter 1
                    </h2>
                    <p>Introduction to the topic
                    </p>
                  </header>
                  <p>Main chapter content goes here.
                  </p>
                  <footer>
                    <p>End of Chapter 1
                    </p>
                  </footer>
                </section>
                """
            }
        }

        @Test("Section with various content types renders correctly")
        func sectionWithVariousContentTypesRendersCorrectly() {
            assertInlineSnapshot(
                of: Section {
                    H2 {
                        HTMLText("Documentation")
                    }
                    Paragraph {
                        HTMLText("This section contains various content types:")
                    }
                    UnorderedList {
                        ListItem {
                            HTMLText("Text content")
                        }
                        ListItem {
                            HTMLText("Code examples")
                        }
                    }
                    PreformattedText {
                        Code {
                            HTMLText("function example() { return true; }")
                        }
                    }
                },
                as: .html
            ) {
                """

                <section>
                  <h2>Documentation
                  </h2>
                  <p>This section contains various content types:
                  </p>
                  <ul>
                    <li>Text content
                    </li>
                    <li>Code examples
                    </li>
                  </ul>
                  <pre><code>function example() { return true; }</code></pre>
                </section>
                """
            }
        }

        @Test("Section within HTMLDocument renders correctly")
        func sectionWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Main {
                        Section {
                            H1 {
                                HTMLText("Introduction")
                            }
                            Paragraph {
                                HTMLText("Welcome to our comprehensive guide.")
                            }
                        }
                        Section {
                            H1 {
                                HTMLText("Getting Started")
                            }
                            Paragraph {
                                HTMLText("Follow these steps to begin.")
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
                <main>
                  <section>
                    <h1>Introduction
                    </h1>
                    <p>Welcome to our comprehensive guide.
                    </p>
                  </section>
                  <section>
                    <h1>Getting Started
                    </h1>
                    <p>Follow these steps to begin.
                    </p>
                  </section>
                </main>
                  </body>
                </html>
                """
            }
        }
    }
}
