import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct InlineFrameTests {
        @Test("Basic iframe renders correctly")
        func basicIframeRendersCorrectly() {
            assertInlineSnapshot(
                of: InlineFrame(
                    src: "https://example.com"
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <iframe src="https://example.com">
                </iframe>
                """
            }
        }

        @Test("Iframe with dimensions renders correctly")
        func iframeWithDimensionsRendersCorrectly() {
            assertInlineSnapshot(
                of: InlineFrame(
                    src: "https://example.com/embed",
                    width: 800,
                    height: 600
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <iframe height="600" width="800" src="https://example.com/embed">
                </iframe>
                """
            }
        }

        @Test("Iframe with allowfullscreen renders correctly")
        func iframeWithAllowfullscreenRendersCorrectly() {
            assertInlineSnapshot(
                of: InlineFrame(
                    src: "https://video.example.com",
                    allowfullscreen: true
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <iframe allowfullscreen src="https://video.example.com">
                </iframe>
                """
            }
        }

        @Test("Iframe with loading lazy renders correctly")
        func iframeWithLoadingLazyRendersCorrectly() {
            assertInlineSnapshot(
                of: InlineFrame(
                    src: "https://example.com/content",
                    loading: .lazy
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <iframe loading="lazy" src="https://example.com/content">
                </iframe>
                """
            }
        }

        @Test("Iframe within HTMLDocument renders correctly")
        func iframeWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        InlineFrame(
                            src: "https://embedded.example.com",
                            width: 640,
                            height: 480
                        ) {
                            HTMLText("Your browser does not support iframes.")
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
                  <iframe height="480" width="640" src="https://embedded.example.com">Your browser does not support iframes.
                  </iframe>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
