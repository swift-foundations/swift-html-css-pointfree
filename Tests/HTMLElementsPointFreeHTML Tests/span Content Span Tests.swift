import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("ContentSpan Element Tests")
    struct ContentSpanTests {
        @Test("Basic span renders correctly")
        func basicSpanRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentSpan {
                    HTMLText("Span content")
                },
                as: .html
            ) {
                """
                <span>Span content</span>
                """
            }
        }

        @Test("Span with class attribute renders correctly")
        func spanWithClassAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentSpan {
                    HTMLText("Highlighted text")
                },
                as: .html
            ) {
                """
                <span>Highlighted text</span>
                """
            }
        }

        @Test("Span within text renders correctly")
        func spanWithinTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This paragraph has ")
                    ContentSpan {
                        HTMLText("accented text")
                    }
                    HTMLText(" within it.")
                },
                as: .html
            ) {
                """

                <p>This paragraph has <span>accented text</span> within it.
                </p>
                """
            }
        }

        @Test("Nested spans render correctly")
        func nestedSpansRenderCorrectly() {
            assertInlineSnapshot(
                of: ContentSpan {
                    HTMLText("Outer ")
                    ContentSpan {
                        HTMLText("inner")
                    }
                    HTMLText(" span")
                },
                as: .html
            ) {
                """
                <span>Outer <span>inner</span> span</span>
                """
            }
        }

        @Test("Span with inline elements renders correctly")
        func spanWithInlineElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentSpan {
                    StrongImportance {
                        HTMLText("Bold")
                    }
                    HTMLText(" and ")
                    Emphasis {
                        HTMLText("italic")
                    }
                    HTMLText(" text")
                },
                as: .html
            ) {
                """
                <span><strong>Bold</strong> and <em>italic</em> text</span>
                """
            }
        }

        @Test("ContentSpan within HTMLDocument renders correctly")
        func contentSpanWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Paragraph {
                            HTMLText("The price is ")
                            ContentSpan {
                                HTMLText("$19.99")
                            }
                            HTMLText(" including tax.")
                        }
                        Paragraph {
                            ContentSpan {
                                HTMLText("Operation completed successfully")
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
                  <p>The price is <span>$19.99</span> including tax.
                  </p>
                  <p><span>Operation completed successfully</span>
                  </p>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
