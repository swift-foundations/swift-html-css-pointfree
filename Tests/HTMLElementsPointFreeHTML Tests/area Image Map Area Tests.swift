import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Area Element Tests")
    struct AreaTests {
        @Test("Basic area renders correctly")
        func basicAreaRendersCorrectly() {
            assertInlineSnapshot(
                of: Area(
                    alt: "Test area",
                    href: "https://example.com"
                ),
                as: .html
            ) {
                """

                <area href="https://example.com" alt="Test area">
                """
            }
        }

        @Test("Area with full attributes renders correctly")
        func areaWithFullAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Area(
                    alt: "Navigate to example",
                    href: "https://example.com",
                    download: "example.pdf",
                    ping: "https://analytics.example.com",
                    referrerpolicy: .noReferrer,
                    rel: .external,
                    target: .blank
                ),
                as: .html
            ) {
                """

                <area target="_blank" rel="external" referrerpolicy="no-referrer" ping="https://analytics.example.com" download="example.pdf" href="https://example.com" alt="Navigate to example">
                """
            }
        }

        @Test("Area within HTMLDocument renders correctly")
        func areaWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Area(
                            alt: "Example area",
                            href: "#section1"
                        )
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
                  <area href="#section1" alt="Example area">
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
