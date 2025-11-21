// import Testing
// import HTMLElementsPointFreeHTML
// import InlineSnapshotTesting
// import PointFreeHTMLTestSupport
// import HTML_Standard_Elements
//
// @Suite(
//    "Abbreviation Element Tests",
//    .snapshots(record: .failed),
// )
// struct AbbreviationTests {
//    @Test("Basic abbreviation renders correctly")
//    func basicAbbreviationRendersCorrectly() {
//        assertInlineSnapshot(
//            of: Abbreviation {
//                HTMLText("HTML")
//            },
//            as: .html
//        ) {
//            """
//            <abbr>HTML</abbr>
//            """
//        }
//    }
//
//    @Test("Abbreviation within text renders correctly")
//    func abbreviationWithinTextRendersCorrectly() {
//        assertInlineSnapshot(
//            of: Paragraph {
//                HTMLText("The ")
//                Abbreviation() {
//                    HTMLText("W3C")
//                }
//                HTMLText(" defines web standards.")
//            },
//            as: .html
//        ) {
//            """
//
//            <p>The <abbr>W3C</abbr> defines web standards.
//            </p>
//            """
//        }
//    }
//
//    @Test("Abbreviation within HTMLDocument renders correctly")
//    func abbreviationWithinHTMLDocumentRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                ContentDivision {
//                    Abbreviation() {
//                        HTMLText("CSS")
//                    }
//                    HTMLText(" is used for styling.")
//                }
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//
//                </style>
//              </head>
//              <body>
//            <div><abbr>CSS</abbr> is used for styling.
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
// }
