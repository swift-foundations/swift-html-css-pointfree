import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Video Embed Element Tests")
    struct VideoTests {
        @Test("Basic video renders correctly")
        func basicVideoRendersCorrectly() {
            assertInlineSnapshot(
                of: Video(src: "movie.mp4") {
                    HTMLText("Your browser does not support the video tag.")
                },
                as: .html
            ) {
                """

                <video src="movie.mp4">Your browser does not support the video tag.
                </video>
                """
            }
        }

        @Test("Video with controls renders correctly")
        func videoWithControlsRendersCorrectly() {
            assertInlineSnapshot(
                of: Video(
                    src: "movie.mp4",
                    controls: true
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <video controls src="movie.mp4">
                </video>
                """
            }
        }

        @Test("Video with multiple attributes renders correctly")
        func videoWithMultipleAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Video(
                    src: "movie.mp4",
                    controls: true,
                    autoplay: true,
                    loop: true,
                    muted: true,
                    width: 640,
                    height: 480
                ) {
                    HTMLText("Video not supported")
                },
                as: .html
            ) {
                """

                <video height="480" width="640" muted loop autoplay controls src="movie.mp4">Video not supported
                </video>
                """
            }
        }

        @Test("Video with poster renders correctly")
        func videoWithPosterRendersCorrectly() {
            assertInlineSnapshot(
                of: Video(
                    src: "movie.mp4",
                    controls: true,
                    poster: "poster.jpg"
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <video poster="poster.jpg" controls src="movie.mp4">
                </video>
                """
            }
        }

        @Test("Video with preload attribute renders correctly")
        func videoWithPreloadAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Video(
                    src: "movie.mp4",
                    controls: true
                ) {
                    HTMLEmpty()
                }
                .attribute("preload", "metadata"),
                as: .html
            ) {
                """

                <video preload="metadata" controls src="movie.mp4">
                </video>
                """
            }
        }

        //    @Test("Video with multiple sources renders correctly")
        //    func videoWithMultipleSourcesRendersCorrectly() {
        //        assertInlineSnapshot(
        //            of: Video(controls: true) {
        //                MediaOrImageSource()
        //                    .attribute("src", "movie.mp4")
        //                    .attribute("type", "video/mp4")
        //                MediaOrImageSource()
        //                    .attribute("src", "movie.webm")
        //                    .attribute("type", "video/webm")
        //                HTMLText("Your browser does not support the video tag.")
        //            },
        //            as: .html
        //        ) {
        //            """
        //
        //            <video controls>
        //              <source type="video/mp4" src="movie.mp4">
        //              <source type="video/webm" src="movie.webm">Your browser does not support the video tag.
        //            </video>
        //            """
        //        }
        //    }

        @Test("Video with track subtitles renders correctly")
        func videoWithTrackSubtitlesRendersCorrectly() {
            assertInlineSnapshot(
                of: Video(
                    src: "movie.mp4",
                    controls: true
                ) {
                    Track(
                        kind: "subtitles",
                        src: "subtitles_en.vtt",
                        srclang: "en",
                        label: "English"
                    )()
                    Track(
                        kind: "subtitles",
                        src: "subtitles_es.vtt",
                        srclang: "es",
                        label: "Español"
                    )()
                },
                as: .html
            ) {
                """

                <video controls src="movie.mp4">
                  <track srclang="en" src="subtitles_en.vtt" label="English" kind="subtitles">
                  <track srclang="es" src="subtitles_es.vtt" label="Español" kind="subtitles">
                </video>
                """
            }
        }

        @Test("Video with playsinline attribute renders correctly")
        func videoWithPlaysinlineAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Video(
                    src: "mobile.mp4",
                    controls: true,
                    muted: true
                ) {
                    HTMLEmpty()
                }
                .attribute("playsinline", ""),
                as: .html
            ) {
                """

                <video playsinline muted controls src="mobile.mp4">
                </video>
                """
            }
        }
    }
}
