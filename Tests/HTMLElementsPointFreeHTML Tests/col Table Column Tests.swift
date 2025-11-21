import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("TableColumn Element Tests")
    struct TableColumnTests {
        @Test("Basic col renders correctly")
        func basicColRendersCorrectly() {
            assertInlineSnapshot(
                of: TableColumn {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <col>
                """
            }
        }

        @Test("Col with span renders correctly")
        func colWithSpanRendersCorrectly() {
            assertInlineSnapshot(
                of: TableColumn(
                    span: 2
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <col span="2">
                """
            }
        }

        @Test("Col with width renders correctly")
        func colWithWidthRendersCorrectly() {
            assertInlineSnapshot(
                of: TableColumn(
                    width: 100
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <col width="100">
                """
            }
        }

        @Test("Col with full attributes renders correctly")
        func colWithFullAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: TableColumn(
                    span: 3,
                    width: 150
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <col width="150" span="3">
                """
            }
        }

        @Test("TableColumn within HTMLDocument renders correctly")
        func tableColumnWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        TableColumn(span: 2) {
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
                  <col span="2">
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
