import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Details Element Tests")
    struct DetailsTests {
        @Test("Basic details renders correctly")
        func basicDetailsRendersCorrectly() {
            assertInlineSnapshot(
                of: Details {
                    DisclosureSummary {
                        HTMLText("Show more details")
                    }
                    Paragraph {
                        HTMLText("This is the hidden content that can be toggled.")
                    }
                },
                as: .html
            ) {
                """

                <details>
                  <summary>Show more details
                  </summary>
                  <p>This is the hidden content that can be toggled.
                  </p>
                </details>
                """
            }
        }

        @Test("Details with open attribute renders correctly")
        func detailsWithOpenAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Details(
                    open: .init()
                ) {
                    DisclosureSummary {
                        HTMLText("FAQ")
                    }
                    Paragraph {
                        HTMLText("This section is open by default.")
                    }
                },
                as: .html
            ) {
                """

                <details open>
                  <summary>FAQ
                  </summary>
                  <p>This section is open by default.
                  </p>
                </details>
                """
            }
        }

        @Test("Details with name attribute renders correctly")
        func detailsWithNameAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Details(
                    name: .init("accordion-group")
                ) {
                    DisclosureSummary {
                        HTMLText("Section 1")
                    }
                    Paragraph {
                        HTMLText("Content for section 1.")
                    }
                },
                as: .html
            ) {
                """

                <details name="accordion-group">
                  <summary>Section 1
                  </summary>
                  <p>Content for section 1.
                  </p>
                </details>
                """
            }
        }

        @Test("Details with complex content renders correctly")
        func detailsWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Details {
                    DisclosureSummary {
                        StrongImportance {
                            HTMLText("Technical Specifications")
                        }
                    }
                    UnorderedList {
                        ListItem {
                            HTMLText("CPU: 8-core processor")
                        }
                        ListItem {
                            HTMLText("RAM: 16GB")
                        }
                        ListItem {
                            HTMLText("Storage: 512GB SSD")
                        }
                    }
                    Paragraph {
                        HTMLText("For more information, visit our ")
                        Anchor(href: "https://example.com/specs") {
                            HTMLText("detailed specifications page")
                        }
                        HTMLText(".")
                    }
                },
                as: .html
            ) {
                """

                <details>
                  <summary><strong>Technical Specifications</strong>
                  </summary>
                  <ul>
                    <li>CPU: 8-core processor
                    </li>
                    <li>RAM: 16GB
                    </li>
                    <li>Storage: 512GB SSD
                    </li>
                  </ul>
                  <p>For more information, visit our <a href="https://example.com/specs">detailed specifications page</a>.
                  </p>
                </details>
                """
            }
        }

        @Test("Multiple details create accordion effect")
        func multipleDetailsCreateAccordionEffect() {
            assertInlineSnapshot(
                of: ContentDivision {
                    Details(name: .init("faq")) {
                        DisclosureSummary {
                            HTMLText("How do I create an account?")
                        }
                        Paragraph {
                            HTMLText("Click the 'Sign Up' button and fill out the form.")
                        }
                    }
                    Details(name: .init("faq")) {
                        DisclosureSummary {
                            HTMLText("How do I reset my password?")
                        }
                        Paragraph {
                            HTMLText("Use the 'Forgot Password' link on the login page.")
                        }
                    }
                    Details(name: .init("faq")) {
                        DisclosureSummary {
                            HTMLText("Is my data secure?")
                        }
                        Paragraph {
                            HTMLText("Yes, we use industry-standard encryption.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <details name="faq">
                    <summary>How do I create an account?
                    </summary>
                    <p>Click the 'Sign Up' button and fill out the form.
                    </p>
                  </details>
                  <details name="faq">
                    <summary>How do I reset my password?
                    </summary>
                    <p>Use the 'Forgot Password' link on the login page.
                    </p>
                  </details>
                  <details name="faq">
                    <summary>Is my data secure?
                    </summary>
                    <p>Yes, we use industry-standard encryption.
                    </p>
                  </details>
                </div>
                """
            }
        }

        @Test("Details with nested content renders correctly")
        func detailsWithNestedContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Details {
                    DisclosureSummary {
                        HTMLText("API Documentation")
                    }
                    Details {
                        DisclosureSummary {
                            HTMLText("Authentication")
                        }
                        Paragraph {
                            HTMLText("Use Bearer tokens for API authentication.")
                        }
                    }
                    Details {
                        DisclosureSummary {
                            HTMLText("Rate Limits")
                        }
                        Paragraph {
                            HTMLText("Maximum 1000 requests per hour.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <details>
                  <summary>API Documentation
                  </summary>
                  <details>
                    <summary>Authentication
                    </summary>
                    <p>Use Bearer tokens for API authentication.
                    </p>
                  </details>
                  <details>
                    <summary>Rate Limits
                    </summary>
                    <p>Maximum 1000 requests per hour.
                    </p>
                  </details>
                </details>
                """
            }
        }

        @Test("Details within HTMLDocument renders correctly")
        func detailsWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Details(
                        open: .init()
                    ) {
                        DisclosureSummary {
                            HTMLText("Welcome!")
                        }
                        Paragraph {
                            HTMLText("Welcome to our website. This section is expanded by default.")
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
                <details open>
                  <summary>Welcome!
                  </summary>
                  <p>Welcome to our website. This section is expanded by default.
                  </p>
                </details>
                  </body>
                </html>
                """
            }
        }
    }
}
