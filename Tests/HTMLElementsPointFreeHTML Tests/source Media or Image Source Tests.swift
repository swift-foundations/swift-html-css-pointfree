import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Source Element Tests")
    struct SourceTests {
        @Test("Basic source renders correctly")
        func basicSourceRendersCorrectly() {
            assertInlineSnapshot(
                of: Source(
                    type: "video/mp4",
                    src: "video.mp4"
                )(),
                as: .html
            ) {
                """

                <source src="video.mp4" type="video/mp4">
                """
            }
        }

        @Test("Source with srcset renders correctly")
        func sourceWithSrcsetRendersCorrectly() {
            assertInlineSnapshot(
                of: Source(
                    type: "image/jpeg",
                    srcset: "image-320w.jpg 320w, image-480w.jpg 480w, image-800w.jpg 800w",
                    sizes: "(max-width: 320px) 280px, (max-width: 480px) 440px, 800px"
                )(),
                as: .html
            ) {
                """

                <source sizes="(max-width: 320px) 280px, (max-width: 480px) 440px, 800px" imagesrcset="image-320w.jpg 320w, image-480w.jpg 480w, image-800w.jpg 800w" type="image/jpeg">
                """
            }
        }

        @Test("Source with media query renders correctly")
        func sourceWithMediaQueryRendersCorrectly() {
            assertInlineSnapshot(
                of: Source(
                    type: "video/mp4",
                    src: "large-video.mp4",
                    media: "(min-width: 768px)"
                )(),
                as: .html
            ) {
                """

                <source media="(min-width: 768px)" src="large-video.mp4" type="video/mp4">
                """
            }
        }

        @Test("Source with dimensions renders correctly")
        func sourceWithDimensionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Source(
                    type: "video/mp4",
                    src: "video-hd.mp4",
                    height: 1080,
                    width: 1920
                )(),
                as: .html
            ) {
                """

                <source width="1920" height="1080" src="video-hd.mp4" type="video/mp4">
                """
            }
        }

        @Test("Source within HTMLDocument renders correctly")
        func sourceWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Source(
                            type: "audio/ogg",
                            src: "audio.ogg"
                        )()
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
                  <source src="audio.ogg" type="audio/ogg">
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
