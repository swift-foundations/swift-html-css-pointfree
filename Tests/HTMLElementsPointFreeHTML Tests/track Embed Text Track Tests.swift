import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct TrackTests {
        @Test("Basic track renders correctly")
        func basicTrackRendersCorrectly() {
            assertInlineSnapshot(
                of: Track(
                    kind: .subtitles,
                    src: "subtitles_en.vtt",
                    label: "English subtitles"
                )(),
                as: .html
            ) {
                """

                <track src="subtitles_en.vtt" label="English subtitles" kind="subtitles">
                """
            }
        }

        @Test("Track with srclang renders correctly")
        func trackWithSrclangRendersCorrectly() {
            assertInlineSnapshot(
                of: Track(
                    kind: .captions,
                    src: "captions_es.vtt",
                    srclang: "es",
                    label: "Spanish captions"
                )(),
                as: .html
            ) {
                """

                <track srclang="es" src="captions_es.vtt" label="Spanish captions" kind="captions">
                """
            }
        }

        @Test("Track with default true renders correctly")
        func trackWithDefaultTrueRendersCorrectly() {
            assertInlineSnapshot(
                of: Track(
                    default: true,
                    kind: .subtitles,
                    src: "subtitles_en.vtt",
                    srclang: "en",
                    label: "English"
                )(),
                as: .html
            ) {
                """

                <track srclang="en" src="subtitles_en.vtt" label="English" kind="subtitles" default>
                """
            }
        }

        @Test("Track with chapters kind renders correctly")
        func trackWithChaptersKindRendersCorrectly() {
            assertInlineSnapshot(
                of: Track(
                    kind: .chapters,
                    src: "chapters.vtt",
                    srclang: "en",
                    label: "Chapters"
                )(),
                as: .html
            ) {
                """

                <track srclang="en" src="chapters.vtt" label="Chapters" kind="chapters">
                """
            }
        }

        @Test("Track within HTMLDocument renders correctly")
        func trackWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Track(
                            kind: "descriptions",
                            src: "descriptions.vtt",
                            label: "Audio descriptions"
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
                  <track src="descriptions.vtt" label="Audio descriptions" kind="descriptions">
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
