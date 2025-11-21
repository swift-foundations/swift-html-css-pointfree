import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("HTML Section Heading Tests")
    struct HTMLSectionHeadingTests {
        @Test("H1 renders correctly")
        func h1RendersCorrectly() {
            assertInlineSnapshot(
                of: H1 {
                    HTMLText("Main Title")
                },
                as: .html
            ) {
                """

                <h1>Main Title
                </h1>
                """
            }
        }

        @Test("H2 renders correctly")
        func h2RendersCorrectly() {
            assertInlineSnapshot(
                of: H2 {
                    HTMLText("Section Title")
                },
                as: .html
            ) {
                """

                <h2>Section Title
                </h2>
                """
            }
        }

        @Test("H3 renders correctly")
        func h3RendersCorrectly() {
            assertInlineSnapshot(
                of: H3 {
                    HTMLText("Subsection Title")
                },
                as: .html
            ) {
                """

                <h3>Subsection Title
                </h3>
                """
            }
        }

        @Test("H4 renders correctly")
        func h4RendersCorrectly() {
            assertInlineSnapshot(
                of: H4 {
                    HTMLText("Sub-subsection Title")
                },
                as: .html
            ) {
                """

                <h4>Sub-subsection Title
                </h4>
                """
            }
        }

        @Test("H5 renders correctly")
        func h5RendersCorrectly() {
            assertInlineSnapshot(
                of: H5 {
                    HTMLText("Minor Heading")
                },
                as: .html
            ) {
                """

                <h5>Minor Heading
                </h5>
                """
            }
        }

        @Test("H6 renders correctly")
        func h6RendersCorrectly() {
            assertInlineSnapshot(
                of: H6 {
                    HTMLText("Smallest Heading")
                },
                as: .html
            ) {
                """

                <h6>Smallest Heading
                </h6>
                """
            }
        }

        @Test("Hierarchical headings render correctly")
        func hierarchicalHeadingsRenderCorrectly() {
            assertInlineSnapshot(
                of: HTMLGroup {
                    H1 {
                        HTMLText("Chapter 1")
                    }
                    H2 {
                        HTMLText("Section 1.1")
                    }
                    H3 {
                        HTMLText("Subsection 1.1.1")
                    }
                },
                as: .html
            ) {
                """

                <h1>Chapter 1
                </h1>
                <h2>Section 1.1
                </h2>
                <h3>Subsection 1.1.1
                </h3>
                """
            }
        }

        @Test("Headings with inline content render correctly")
        func headingsWithInlineContentRenderCorrectly() {
            assertInlineSnapshot(
                of: H1 {
                    HTMLText("Title with ")
                    Emphasis {
                        HTMLText("emphasis")
                    }
                    HTMLText(" and ")
                    Code {
                        HTMLText("code")
                    }
                },
                as: .html
            ) {
                """

                <h1>Title with <em>emphasis</em> and <code>code</code>
                </h1>
                """
            }
        }

        @Test("Headings within HTMLDocument render correctly")
        func headingsWithinHTMLDocumentRenderCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H1 {
                            HTMLText("Article Title")
                        }
                        H2 {
                            HTMLText("Introduction")
                        }
                        Paragraph {
                            HTMLText("Article content goes here.")
                        }
                        H2 {
                            HTMLText("Conclusion")
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
                  <h1>Article Title
                  </h1>
                  <h2>Introduction
                  </h2>
                  <p>Article content goes here.
                  </p>
                  <h2>Conclusion
                  </h2>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
