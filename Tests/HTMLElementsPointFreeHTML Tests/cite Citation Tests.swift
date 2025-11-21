import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Cite Element Tests")
    struct CiteTests {
        @Test("Basic cite renders correctly")
        func basicCiteRendersCorrectly() {
            assertInlineSnapshot(
                of: Cite {
                    HTMLText("The Great Gatsby")
                },
                as: .html
            ) {
                """
                <cite>The Great Gatsby</cite>
                """
            }
        }

        @Test("Cite within blockquote renders correctly")
        func citeWithinBlockquoteRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    Paragraph {
                        HTMLText(
                            "Two roads diverged in a wood, and I— I took the one less traveled by, And that has made all the difference."
                        )
                    }
                    Cite {
                        HTMLText("The Road Not Taken by Robert Frost")
                    }
                },
                as: .html
            ) {
                """

                <blockquote>
                  <p>Two roads diverged in a wood, and I— I took the one less traveled by, And that has made all the difference.
                  </p><cite>The Road Not Taken by Robert Frost</cite>
                </blockquote>
                """
            }
        }

        @Test("Cite with link renders correctly")
        func citeWithLinkRendersCorrectly() {
            assertInlineSnapshot(
                of: Cite {
                    Anchor(
                        href: "https://example.com/book"
                    ) {
                        HTMLText("1984 by George Orwell")
                    }
                },
                as: .html
            ) {
                """
                <cite><a href="https://example.com/book">1984 by George Orwell</a></cite>
                """
            }
        }

        @Test("Cite within HTMLDocument renders correctly")
        func citeWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Paragraph {
                        HTMLText("As mentioned in ")
                        Cite {
                            HTMLText("The Elements of Style")
                        }
                        HTMLText(", clarity is essential in writing.")
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
                <p>As mentioned in <cite>The Elements of Style</cite>, clarity is essential in writing.
                </p>
                  </body>
                </html>
                """
            }
        }
    }
}
