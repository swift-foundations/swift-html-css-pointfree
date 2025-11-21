import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct MetaTests {
        @Test("Meta with charset renders correctly")
        func metaWithCharsetRendersCorrectly() {
            assertInlineSnapshot(
                of: Meta(
                    charset: "UTF-8"
                )(),
                as: .html
            ) {
                """

                <meta charset="UTF-8">
                """
            }
        }

        @Test("Meta with name and content renders correctly")
        func metaWithNameAndContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Meta(
                    name: "viewport",
                    content: "width=device-width, initial-scale=1.0"
                )(),
                as: .html
            ) {
                """

                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                """
            }
        }

        @Test("Meta with http-equiv renders correctly")
        func metaWithHttpEquivRendersCorrectly() {
            assertInlineSnapshot(
                of: Meta(
                    httpEquiv: .refresh,
                    content: "30"
                )(),
                as: .html
            ) {
                """

                <meta http-equiv="refresh" content="30">
                """
            }
        }

        @Test("Meta with media renders correctly")
        func metaWithMediaRendersCorrectly() {
            assertInlineSnapshot(
                of: Meta(
                    name: "theme-color",
                    content: "#ffffff",
                    media: "(prefers-color-scheme: light)"
                )(),
                as: .html
            ) {
                """

                <meta name="theme-color" media="(prefers-color-scheme: light)" content="#ffffff">
                """
            }
        }

        @Test("Meta within HTMLDocument renders correctly")
        func metaWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Meta(
                        name: "description",
                        content: "A comprehensive HTML testing framework"
                    )()
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
                <meta name="description" content="A comprehensive HTML testing framework">
                  </body>
                </html>
                """
            }
        }
    }
}
