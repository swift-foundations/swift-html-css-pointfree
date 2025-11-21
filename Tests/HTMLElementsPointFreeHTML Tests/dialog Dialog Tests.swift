import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Dialog Element Tests")
    struct DialogTests {
        @Test("Basic dialog renders correctly")
        func basicDialogRendersCorrectly() {
            assertInlineSnapshot(
                of: Dialog {
                    HTMLText("This is a dialog")
                },
                as: .html
            ) {
                """

                <dialog>This is a dialog
                </dialog>
                """
            }
        }

        @Test("Dialog with open attribute renders correctly")
        func dialogWithOpenAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Dialog(
                    open: true
                ) {
                    HTMLText("This dialog is open")
                },
                as: .html
            ) {
                """

                <dialog open>This dialog is open
                </dialog>
                """
            }
        }

        @Test("Dialog with complex content renders correctly")
        func dialogWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Dialog(
                    open: true
                ) {
                    H1 {
                        HTMLText("Confirm Action")
                    }
                    Paragraph {
                        HTMLText("Are you sure you want to proceed?")
                    }
                },
                as: .html
            ) {
                """

                <dialog open>
                  <h1>Confirm Action
                  </h1>
                  <p>Are you sure you want to proceed?
                  </p>
                </dialog>
                """
            }
        }

        @Test("Dialog within HTMLDocument renders correctly")
        func dialogWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Dialog {
                            HTMLText("Modal content")
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
                  <dialog>Modal content
                  </dialog>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
