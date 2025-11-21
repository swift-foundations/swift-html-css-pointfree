import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Figure Caption Element Tests")
    struct FigureCaptionElementTests {
        @Test("Basic figure caption renders correctly")
        func basicFigureCaptionRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    HTMLText("A beautiful landscape photograph")
                },
                as: .html
            ) {
                """

                <figcaption>A beautiful landscape photograph
                </figcaption>
                """
            }
        }

        @Test("Figure caption with emphasis renders correctly")
        func figureCaptionWithEmphasisRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    StrongImportance {
                        HTMLText("Figure 1:")
                    }
                    HTMLText(" Annual sales growth")
                },
                as: .html
            ) {
                """

                <figcaption><strong>Figure 1:</strong> Annual sales growth
                </figcaption>
                """
            }
        }

        @Test("Figure caption with code reference renders correctly")
        func figureCaptionWithCodeReferenceRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    HTMLText("Output of ")
                    Code {
                        HTMLText("getData()")
                    }
                    HTMLText(" function")
                },
                as: .html
            ) {
                """

                <figcaption>Output of <code>getData()</code> function
                </figcaption>
                """
            }
        }

        @Test("Figure caption within HTMLDocument renders correctly")
        func figureCaptionWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    FigureCaption {
                        HTMLText("Standalone caption for testing")
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
                <figcaption>Standalone caption for testing
                </figcaption>
                  </body>
                </html>
                """
            }
        }
    }
}
