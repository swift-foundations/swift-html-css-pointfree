import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct ListItemTests {
        @Test("Basic li renders correctly")
        func basicLiRendersCorrectly() {
            assertInlineSnapshot(
                of: ListItem {
                    HTMLText("List item content")
                },
                as: .html
            ) {
                """

                <li>List item content
                </li>
                """
            }
        }

        @Test("Li with value renders correctly")
        func liWithValueRendersCorrectly() {
            assertInlineSnapshot(
                of: ListItem(
                    value: 5
                ) {
                    HTMLText("Fifth item")
                },
                as: .html
            ) {
                """

                <li value="5">Fifth item
                </li>
                """
            }
        }

        @Test("Li with inline elements renders correctly")
        func liWithInlineElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: ListItem {
                    StrongImportance {
                        HTMLText("Bold text")
                    }
                    HTMLText(" and ")
                    Emphasis {
                        HTMLText("italic text")
                    }
                    HTMLText(" in list item")
                },
                as: .html
            ) {
                """

                <li><strong>Bold text</strong> and <em>italic text</em> in list item
                </li>
                """
            }
        }

        @Test("Li with nested elements renders correctly")
        func liWithNestedElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: ListItem {
                    Paragraph {
                        HTMLText("Paragraph in list item")
                    }
                    Code {
                        HTMLText("console.log('code block');")
                    }
                },
                as: .html
            ) {
                """

                <li>
                  <p>Paragraph in list item
                  </p><code>console.log('code block');</code>
                </li>
                """
            }
        }

        @Test("ListItem within HTMLDocument renders correctly")
        func listItemWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    OrderedList {
                        ListItem(value: 1) {
                            HTMLText("First step")
                        }
                        ListItem(value: 2) {
                            HTMLText("Second step")
                        }
                        ListItem(value: 3) {
                            HTMLText("Third step")
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
                <ol>
                  <li value="1">First step
                  </li>
                  <li value="2">Second step
                  </li>
                  <li value="3">Third step
                  </li>
                </ol>
                  </body>
                </html>
                """
            }
        }
    }
}
