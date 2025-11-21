import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("ThematicBreak Element Tests")
    struct ThematicBreakTests {
        @Test("Basic hr renders correctly")
        func basicHrRendersCorrectly() {
            assertInlineSnapshot(
                of: ThematicBreak(),
                as: .html
            ) {
                """

                <hr>
                """
            }
        }

        @Test("ThematicBreak within HTMLDocument renders correctly")
        func thematicBreakWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        ThematicBreak()
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
                  <hr>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
