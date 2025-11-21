import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Embed Audio Element Tests")
    struct AudioTests {
        @Test("Basic audio renders correctly")
        func basicAudioRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(src: "audio.mp3") {
                    HTMLText("Your browser does not support the audio element.")
                },
                as: .html
            ) {
                """

                <audio src="audio.mp3">Your browser does not support the audio element.
                </audio>
                """
            }
        }

        @Test("Audio with controls renders correctly")
        func audioWithControlsRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(
                    src: "audio.mp3",
                    controls: true
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <audio controls src="audio.mp3">
                </audio>
                """
            }
        }

        @Test("Audio with multiple attributes renders correctly")
        func audioWithMultipleAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(
                    src: "background.mp3",
                    controls: true,
                    autoplay: true,
                    loop: true,
                    muted: true
                ) {
                    HTMLText("Audio not supported")
                },
                as: .html
            ) {
                """

                <audio muted loop autoplay controls src="background.mp3">Audio not supported
                </audio>
                """
            }
        }

        @Test("Audio with preload attribute renders correctly")
        func audioWithPreloadAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(
                    src: "podcast.mp3",
                    controls: true
                ) {
                    HTMLEmpty()
                }
                .attribute("preload", "none"),
                as: .html
            ) {
                """

                <audio preload="none" controls src="podcast.mp3">
                </audio>
                """
            }
        }

        @Test("Audio with multiple sources renders correctly")
        func audioWithMultipleSourcesRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(controls: true) {
                    Source(
                        type: "audio/mpeg",
                        src: "audio.mp3"
                    )()
                    Source(
                        type: "audio.ogg",
                        src: "audio/ogg"
                    )()
                    Source(
                        type: "audio.wav",
                        src: "audio/wav"
                    )()
                    HTMLText("Your browser does not support the audio element.")
                },
                as: .html
            ) {
                """

                <audio controls>
                  <source src="audio.mp3" type="audio/mpeg">
                  <source src="audio/ogg" type="audio.ogg">
                  <source src="audio/wav" type="audio.wav">Your browser does not support the audio element.
                </audio>
                """
            }
        }

        @Test("Audio with volume control renders correctly")
        func audioWithVolumeControlRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(
                    src: "music.mp3",
                    controls: true
                ) {
                    HTMLEmpty()
                }
                .attribute("volume", "0.5"),
                as: .html
            ) {
                """

                <audio volume="0.5" controls src="music.mp3">
                </audio>
                """
            }
        }

        @Test("Audio without src using sources renders correctly")
        func audioWithoutSrcUsingSourcesRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(controls: true) {
                    Source(
                        type: "audio/flac",
                        src: "song.flac"
                    )()
                    Source(
                        type: "audio/mpeg",
                        src: "song.mp3"
                    )()
                    HTMLText("Fallback text for unsupported browsers")
                },
                as: .html
            ) {
                """

                <audio controls>
                  <source src="song.flac" type="audio/flac">
                  <source src="song.mp3" type="audio/mpeg">Fallback text for unsupported browsers
                </audio>
                """
            }
        }

        @Test("Muted autoplay audio renders correctly")
        func mutedAutoplayAudioRendersCorrectly() {
            assertInlineSnapshot(
                of: Audio(
                    src: "ambient.mp3",
                    autoplay: true,
                    loop: true,
                    muted: true
                ) {
                    HTMLEmpty()
                }
                .attribute("style", "display: none;"),
                as: .html
            ) {
                """

                <audio style="display: none;" muted loop autoplay src="ambient.mp3">
                </audio>
                """
            }
        }
    }
}
