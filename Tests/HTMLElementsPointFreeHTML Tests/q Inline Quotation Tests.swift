import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Inline Quotation Element Tests")
    struct InlineQuotationTests {
        @Test("Basic inline quotation renders correctly")
        func basicInlineQuotationRendersCorrectly() {
            assertInlineSnapshot(
                of: InlineQuotation {
                    HTMLText("To be or not to be")
                },
                as: .html
            ) {
                """
                <q>To be or not to be</q>
                """
            }
        }

        @Test("Inline quotation with cite attribute renders correctly")
        func inlineQuotationWithCiteAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: InlineQuotation(
                    cite: .init("https://example.com/hamlet")
                ) {
                    HTMLText("To be or not to be, that is the question")
                },
                as: .html
            ) {
                """
                <q cite="https://example.com/hamlet">To be or not to be, that is the question</q>
                """
            }
        }

        @Test("Inline quotation within paragraph renders correctly")
        func inlineQuotationWithinParagraphRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Shakespeare wrote ")
                    InlineQuotation {
                        HTMLText("All the world's a stage")
                    }
                    HTMLText(" in As You Like It.")
                },
                as: .html
            ) {
                """

                <p>Shakespeare wrote <q>All the world's a stage</q> in As You Like It.
                </p>
                """
            }
        }

        @Test("Nested inline quotations render correctly")
        func nestedInlineQuotationsRenderCorrectly() {
            assertInlineSnapshot(
                of: InlineQuotation {
                    HTMLText("She said ")
                    InlineQuotation {
                        HTMLText("Hello, world!")
                    }
                    HTMLText(" to me yesterday.")
                },
                as: .html
            ) {
                """
                <q>She said <q>Hello, world!</q> to me yesterday.</q>
                """
            }
        }

        @Test("Inline quotation with link renders correctly")
        func inlineQuotationWithLinkRendersCorrectly() {
            assertInlineSnapshot(
                of: InlineQuotation(
                    cite: .init("https://example.com/source")
                ) {
                    Anchor(
                        href: "https://example.com/full-text"
                    ) {
                        HTMLText("The only thing we have to fear is fear itself")
                    }
                },
                as: .html
            ) {
                """
                <q cite="https://example.com/source"><a href="https://example.com/full-text">The only thing we have to fear is fear itself</a></q>
                """
            }
        }

        @Test("Inline quotation within HTMLDocument renders correctly")
        func inlineQuotationWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        HTMLText("As Einstein said, ")
                        InlineQuotation(
                            cite: .init("https://example.com/einstein-quotes")
                        ) {
                            HTMLText("Imagination is more important than knowledge.")
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
                <div>As Einstein said, <q cite="https://example.com/einstein-quotes">Imagination is more important than knowledge.</q>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
