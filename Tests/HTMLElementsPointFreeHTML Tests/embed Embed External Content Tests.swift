import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Embed Element Tests")
    struct EmbedTests {
        @Test("Basic embed renders correctly")
        func basicEmbedRendersCorrectly() {
            assertInlineSnapshot(
                of: Embed(
                    src: "video.mp4"
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <embed src="video.mp4">
                """
            }
        }

        @Test("Embed with type renders correctly")
        func embedWithTypeRendersCorrectly() {
            assertInlineSnapshot(
                of: Embed(
                    src: "document.pdf",
                    type: "application/pdf"
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <embed type="application/pdf" src="document.pdf">
                """
            }
        }

        @Test("Embed with dimensions renders correctly")
        func embedWithDimensionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Embed(
                    src: "flash.swf",
                    width: 800,
                    height: 600
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <embed width="800" height="600" src="flash.swf">
                """
            }
        }

        @Test("Embed with full attributes renders correctly")
        func embedWithFullAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Embed(
                    src: "media.swf",
                    type: "application/x-shockwave-flash",
                    width: 640,
                    height: 480
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <embed width="640" height="480" type="application/x-shockwave-flash" src="media.swf">
                """
            }
        }

        @Test("Embed within HTMLDocument renders correctly")
        func embedWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Embed(
                            src: "presentation.pdf",
                            type: "application/pdf"
                        ) {
                            HTMLEmpty()
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
                  <embed type="application/pdf" src="presentation.pdf">
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
