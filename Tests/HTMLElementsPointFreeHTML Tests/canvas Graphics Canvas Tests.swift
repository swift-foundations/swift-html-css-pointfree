import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Canvas Element Tests")
    struct CanvasTests {
        @Test("Basic canvas renders correctly")
        func basicCanvasRendersCorrectly() {
            assertInlineSnapshot(
                of: Canvas {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <canvas>
                </canvas>
                """
            }
        }

        @Test("Canvas with dimensions renders correctly")
        func canvasWithDimensionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Canvas(
                    width: 800,
                    height: 600
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <canvas height="600" width="800">
                </canvas>
                """
            }
        }

        @Test("Canvas with content renders correctly")
        func canvasWithContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Canvas(
                    width: 400,
                    height: 300
                ) {
                    HTMLText("Your browser does not support the HTML canvas tag.")
                },
                as: .html
            ) {
                """

                <canvas height="300" width="400">Your browser does not support the HTML canvas tag.
                </canvas>
                """
            }
        }

        @Test("Canvas within HTMLDocument renders correctly")
        func canvasWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Canvas(
                            width: 640,
                            height: 480
                        ) {
                            HTMLText("Canvas not supported")
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
                  <canvas height="480" width="640">Canvas not supported
                  </canvas>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
