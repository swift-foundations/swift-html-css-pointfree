import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct LinkTests {
        @Test("Basic link renders correctly")
        func basicLinkRendersCorrectly() {
            assertInlineSnapshot(
                of: Link(
                    href: "style.css",
                    rel: .stylesheet
                )(),
                as: .html
            ) {
                """

                <link rel="stylesheet" href="style.css">
                """
            }
        }

        @Test("Link with type and media renders correctly")
        func linkWithTypeAndMediaRendersCorrectly() {
            assertInlineSnapshot(
                of: Link(
                    href: "print.css",
                    media: "print",
                    rel: .stylesheet,
                    type: "text/css"
                )(),
                as: .html
            ) {
                """

                <link type="text/css" rel="stylesheet" media="print" href="print.css">
                """
            }
        }

        @Test("Link with crossorigin renders correctly")
        func linkWithCrossoriginRendersCorrectly() {
            assertInlineSnapshot(
                of: Link(
                    as: "font",
                    crossorigin: .anonymous,
                    href: "https://cdn.example.com/font.woff2",
                    rel: .preload,
                    type: "font/woff2"
                )(),
                as: .html
            ) {
                """

                <link type="font/woff2" rel="preload" href="https://cdn.example.com/font.woff2" crossorigin="anonymous" as="font">
                """
            }
        }

        @Test("Link with integrity renders correctly")
        func linkWithIntegrityRendersCorrectly() {
            assertInlineSnapshot(
                of: Link(
                    href: "https://cdn.example.com/bootstrap.css",
                    integrity:
                        "sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC",
                    rel: .stylesheet
                )(),
                as: .html
            ) {
                """

                <link rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" href="https://cdn.example.com/bootstrap.css">
                """
            }
        }

        @Test("Link within HTMLDocument renders correctly")
        func linkWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Link(
                        href: "main.css",
                        rel: .stylesheet
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
                <link rel="stylesheet" href="main.css">
                  </body>
                </html>
                """
            }
        }
    }
}
