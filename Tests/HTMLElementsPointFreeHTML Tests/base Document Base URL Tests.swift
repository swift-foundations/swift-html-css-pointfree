import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Base Element Tests")
    struct BaseTests {
        @Test("Base with href renders correctly")
        func baseWithHrefRendersCorrectly() {
            assertInlineSnapshot(
                of: Base(
                    configuration: .href("https://example.com/")
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <base href="https://example.com/">
                """
            }
        }

        @Test("Base with target renders correctly")
        func baseWithTargetRendersCorrectly() {
            assertInlineSnapshot(
                of: Base(
                    configuration: .target(.blank)
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <base target="_blank">
                """
            }
        }

        @Test("Base with both href and target renders correctly")
        func baseWithBothHrefAndTargetRendersCorrectly() {
            assertInlineSnapshot(
                of: Base(
                    configuration: .both(href: "https://example.com/", target: .blank)
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <base target="_blank" href="https://example.com/">
                """
            }
        }

        @Test("Base within HTMLDocument renders correctly")
        func baseWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Base(
                        configuration: .href("https://example.com/")
                    ) {
                        HTMLEmpty()
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
                <base href="https://example.com/">
                  </body>
                </html>
                """
            }
        }
    }
}
