import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct InsertedTextTests {
        @Test("Basic ins renders correctly")
        func basicInsRendersCorrectly() {
            assertInlineSnapshot(
                of: InsertedText {
                    HTMLText("This text was added to the document")
                },
                as: .html
            ) {
                """
                <ins>This text was added to the document</ins>
                """
            }
        }

        @Test("Ins with datetime renders correctly")
        func insWithDatetimeRendersCorrectly() {
            assertInlineSnapshot(
                of: InsertedText(
                    datetime: "2024-03-15T10:30:00Z"
                ) {
                    HTMLText("Updated pricing information")
                },
                as: .html
            ) {
                """
                <ins datetime="2024-03-15T10:30:00Z">Updated pricing information</ins>
                """
            }
        }

        @Test("Ins with cite renders correctly")
        func insWithCiteRendersCorrectly() {
            assertInlineSnapshot(
                of: InsertedText(
                    cite: "https://example.com/edit-log/123"
                ) {
                    HTMLText("Additional safety guidelines")
                },
                as: .html
            ) {
                """
                <ins cite="https://example.com/edit-log/123">Additional safety guidelines</ins>
                """
            }
        }

        @Test("Ins with both cite and datetime renders correctly")
        func insWithBothCiteAndDatetimeRendersCorrectly() {
            assertInlineSnapshot(
                of: InsertedText(
                    cite: "https://example.com/changelog/v2.1",
                    datetime: "2024-01-20T14:15:00Z"
                ) {
                    HTMLText("New feature: Dark mode support")
                },
                as: .html
            ) {
                """
                <ins datetime="2024-01-20T14:15:00Z" cite="https://example.com/changelog/v2.1">New feature: Dark mode support</ins>
                """
            }
        }

        @Test("Ins with complex content renders correctly")
        func insWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: InsertedText(
                    datetime: "2024-02-10T16:45:00Z"
                ) {
                    StrongImportance {
                        HTMLText("Important Update:")
                    }
                    HTMLText(" We have added support for ")
                    Code {
                        HTMLText("async/await")
                    }
                    HTMLText(" syntax in our JavaScript API.")
                },
                as: .html
            ) {
                """
                <ins datetime="2024-02-10T16:45:00Z"><strong>Important Update:</strong> We have added support for <code>async/await</code> syntax in our JavaScript API.</ins>
                """
            }
        }

        @Test("Ins in document revision context renders correctly")
        func insInDocumentRevisionContextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The meeting will be held on ")
                    InsertedText(
                        cite: "https://example.com/meeting-updates/456",
                        datetime: "2024-03-01T09:00:00Z"
                    ) {
                        HTMLText("Friday, March 8th at 2:00 PM")
                    }
                    HTMLText(" in the main conference room.")
                },
                as: .html
            ) {
                """

                <p>The meeting will be held on <ins datetime="2024-03-01T09:00:00Z" cite="https://example.com/meeting-updates/456">Friday, March 8th at 2:00 PM</ins> in the main conference room.
                </p>
                """
            }
        }

        @Test("InsertedText within HTMLDocument renders correctly")
        func insertedTextWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Document Revision History")
                        }
                        Section {
                            H3 {
                                HTMLText("Version 2.1 Changes")
                            }
                            Paragraph {
                                HTMLText("This document has been updated to include:")
                            }
                            UnorderedList {
                                ListItem {
                                    InsertedText(
                                        cite: "https://example.com/updates/security",
                                        datetime: "2024-01-15T11:30:00Z"
                                    ) {
                                        HTMLText("Enhanced security protocols")
                                    }
                                }
                                ListItem {
                                    InsertedText(
                                        cite: "https://example.com/updates/accessibility",
                                        datetime: "2024-01-20T14:15:00Z"
                                    ) {
                                        HTMLText("Improved accessibility guidelines")
                                    }
                                }
                                ListItem {
                                    InsertedText(
                                        datetime: "2024-01-25T10:00:00Z"
                                    ) {
                                        HTMLText("Additional code examples and best practices")
                                    }
                                }
                            }
                        }
                        Paragraph {
                            HTMLText("For technical specifications, please refer to ")
                            InsertedText(
                                cite: "https://example.com/technical-specs/v2.1",
                                datetime: "2024-02-01T16:30:00Z"
                            ) {
                                Anchor(href: "https://example.com/specs") {
                                    HTMLText("the updated technical documentation")
                                }
                            }
                            HTMLText(".")
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
                <article>
                  <h2>Document Revision History
                  </h2>
                  <section>
                    <h3>Version 2.1 Changes
                    </h3>
                    <p>This document has been updated to include:
                    </p>
                    <ul>
                      <li><ins datetime="2024-01-15T11:30:00Z" cite="https://example.com/updates/security">Enhanced security protocols</ins>
                      </li>
                      <li><ins datetime="2024-01-20T14:15:00Z" cite="https://example.com/updates/accessibility">Improved accessibility guidelines</ins>
                      </li>
                      <li><ins datetime="2024-01-25T10:00:00Z">Additional code examples and best practices</ins>
                      </li>
                    </ul>
                  </section>
                  <p>For technical specifications, please refer to <ins datetime="2024-02-01T16:30:00Z" cite="https://example.com/technical-specs/v2.1"><a href="https://example.com/specs">the updated technical documentation</a></ins>.
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
