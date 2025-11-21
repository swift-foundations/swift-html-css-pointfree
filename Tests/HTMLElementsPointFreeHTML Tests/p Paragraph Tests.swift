import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct ParagraphTests {
        @Test("Basic paragraph renders correctly")
        func basicParagraphRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This is a simple paragraph.")
                },
                as: .html
            ) {
                """

                <p>This is a simple paragraph.
                </p>
                """
            }
        }

        @Test("Paragraph with inline elements renders correctly")
        func paragraphWithInlineElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This paragraph has ")
                    Emphasis {
                        HTMLText("emphasized")
                    }
                    HTMLText(" and ")
                    StrongImportance {
                        HTMLText("strong")
                    }
                    HTMLText(" text.")
                },
                as: .html
            ) {
                """

                <p>This paragraph has <em>emphasized</em> and <strong>strong</strong> text.
                </p>
                """
            }
        }

        @Test("Paragraph with link renders correctly")
        func paragraphWithLinkRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Visit our ")
                    Anchor(
                        href: "https://example.com"
                    ) {
                        HTMLText("website")
                    }
                    HTMLText(" for more information.")
                },
                as: .html
            ) {
                """

                <p>Visit our <a href="https://example.com">website</a> for more information.
                </p>
                """
            }
        }

        @Test("Multiple paragraphs render correctly")
        func multipleParagraphsRenderCorrectly() {
            assertInlineSnapshot(
                of: HTMLGroup {
                    Paragraph {
                        HTMLText("First paragraph.")
                    }
                    Paragraph {
                        HTMLText("Second paragraph.")
                    }
                },
                as: .html
            ) {
                """

                <p>First paragraph.
                </p>
                <p>Second paragraph.
                </p>
                """
            }
        }

        @Test("Paragraph within HTMLDocument renders correctly")
        func paragraphWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H1 {
                            HTMLText("Article Title")
                        }
                        Paragraph {
                            HTMLText("This is the first paragraph of the article.")
                        }
                        Paragraph {
                            HTMLText("This is the second paragraph with more content.")
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
                  <p>This is the first paragraph of the article.
                  </p>
                  <p>This is the second paragraph with more content.
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
