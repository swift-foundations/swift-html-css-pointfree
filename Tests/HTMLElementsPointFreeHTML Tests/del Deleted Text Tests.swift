import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Del Element Tests")
    struct DelTests {
        @Test("Basic del renders correctly")
        func basicDelRendersCorrectly() {
            assertInlineSnapshot(
                of: Del {
                    HTMLText("This content has been removed")
                },
                as: .html
            ) {
                """

                <del>This content has been removed
                </del>
                """
            }
        }

        @Test("Del with datetime renders correctly")
        func delWithDatetimeRendersCorrectly() {
            assertInlineSnapshot(
                of: Del(
                    datetime: "2024-03-10T14:30:00Z"
                ) {
                    HTMLText("Outdated policy information")
                },
                as: .html
            ) {
                """

                <del datetime="2024-03-10T14:30:00Z">Outdated policy information
                </del>
                """
            }
        }

        @Test("Del with cite renders correctly")
        func delWithCiteRendersCorrectly() {
            assertInlineSnapshot(
                of: Del(
                    cite: "https://example.com/edit-log/456"
                ) {
                    HTMLText("Incorrect pricing information")
                },
                as: .html
            ) {
                """

                <del cite="https://example.com/edit-log/456">Incorrect pricing information
                </del>
                """
            }
        }

        @Test("Del with both cite and datetime renders correctly")
        func delWithBothCiteAndDatetimeRendersCorrectly() {
            assertInlineSnapshot(
                of: Del(
                    cite: "https://example.com/changelog/v1.9",
                    datetime: "2024-02-05T10:15:00Z"
                ) {
                    HTMLText("Deprecated feature: Legacy authentication")
                },
                as: .html
            ) {
                """

                <del datetime="2024-02-05T10:15:00Z" cite="https://example.com/changelog/v1.9">Deprecated feature: Legacy authentication
                </del>
                """
            }
        }

        @Test("Del with complex content renders correctly")
        func delWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Del(
                    datetime: "2024-01-20T09:45:00Z"
                ) {
                    StrongImportance {
                        HTMLText("Notice:")
                    }
                    HTMLText(" The old API endpoint ")
                    Code {
                        HTMLText("/api/v1/users")
                    }
                    HTMLText(" is no longer supported.")
                },
                as: .html
            ) {
                """

                <del datetime="2024-01-20T09:45:00Z"><strong>Notice:</strong> The old API endpoint <code>/api/v1/users</code> is no longer supported.
                </del>
                """
            }
        }

        @Test("Del in document revision context renders correctly")
        func delInDocumentRevisionContextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The conference will be held ")
                    Del(
                        cite: "https://example.com/event-updates/789",
                        datetime: "2024-02-28T16:00:00Z"
                    ) {
                        HTMLText("in New York")
                    }
                    HTMLText(" virtually via Zoom.")
                },
                as: .html
            ) {
                """

                <p>The conference will be held 
                  <del datetime="2024-02-28T16:00:00Z" cite="https://example.com/event-updates/789">in New York
                  </del> virtually via Zoom.
                </p>
                """
            }
        }

        @Test("Del within HTMLDocument renders correctly")
        func delWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Document Change Log")
                        }
                        Section {
                            H3 {
                                HTMLText("Version 1.5 Removals")
                            }
                            Paragraph {
                                HTMLText("The following items have been removed from this version:")
                            }
                            UnorderedList {
                                ListItem {
                                    Del(
                                        cite: "https://example.com/removals/feature-x",
                                        datetime: "2024-01-10T12:00:00Z"
                                    ) {
                                        HTMLText("Experimental feature X (beta)")
                                    }
                                }
                                ListItem {
                                    Del(
                                        cite: "https://example.com/removals/deprecated-api",
                                        datetime: "2024-01-15T14:30:00Z"
                                    ) {
                                        HTMLText("Legacy API endpoints for user management")
                                    }
                                }
                                ListItem {
                                    Del(
                                        datetime: "2024-01-20T11:15:00Z"
                                    ) {
                                        HTMLText("Outdated documentation sections")
                                    }
                                }
                            }
                        }
                        Paragraph {
                            HTMLText("For more information about these changes, see ")
                            Del(
                                cite: "https://example.com/old-migration-guide",
                                datetime: "2024-02-01T10:00:00Z"
                            ) {
                                Anchor(href: "https://example.com/old-guide") {
                                    HTMLText("the old migration guide")
                                }
                            }
                            HTMLText(" our updated documentation.")
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
                  <h2>Document Change Log
                  </h2>
                  <section>
                    <h3>Version 1.5 Removals
                    </h3>
                    <p>The following items have been removed from this version:
                    </p>
                    <ul>
                      <li>
                        <del datetime="2024-01-10T12:00:00Z" cite="https://example.com/removals/feature-x">Experimental feature X (beta)
                        </del>
                      </li>
                      <li>
                        <del datetime="2024-01-15T14:30:00Z" cite="https://example.com/removals/deprecated-api">Legacy API endpoints for user management
                        </del>
                      </li>
                      <li>
                        <del datetime="2024-01-20T11:15:00Z">Outdated documentation sections
                        </del>
                      </li>
                    </ul>
                  </section>
                  <p>For more information about these changes, see 
                    <del datetime="2024-02-01T10:00:00Z" cite="https://example.com/old-migration-guide"><a href="https://example.com/old-guide">the old migration guide</a>
                    </del> our updated documentation.
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
