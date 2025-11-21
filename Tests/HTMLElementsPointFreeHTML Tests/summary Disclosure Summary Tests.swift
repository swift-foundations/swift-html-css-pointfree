import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Disclosure Summary Element Tests")
    struct DisclosureSummaryTests {
        @Test("Basic disclosure summary renders correctly")
        func basicDisclosureSummaryRendersCorrectly() {
            assertInlineSnapshot(
                of: DisclosureSummary {
                    HTMLText("Click to expand")
                },
                as: .html
            ) {
                """

                <summary>Click to expand
                </summary>
                """
            }
        }

        @Test("Disclosure summary within details renders correctly")
        func disclosureSummaryWithinDetailsRendersCorrectly() {
            assertInlineSnapshot(
                of: Details {
                    DisclosureSummary {
                        HTMLText("Show FAQ")
                    }
                    Paragraph {
                        HTMLText("Here are the frequently asked questions.")
                    }
                },
                as: .html
            ) {
                """

                <details>
                  <summary>Show FAQ
                  </summary>
                  <p>Here are the frequently asked questions.
                  </p>
                </details>
                """
            }
        }

        @Test("Disclosure summary with emphasis renders correctly")
        func disclosureSummaryWithEmphasisRendersCorrectly() {
            assertInlineSnapshot(
                of: DisclosureSummary {
                    StrongImportance {
                        HTMLText("Important Information")
                    }
                    HTMLText(" - Click to read")
                },
                as: .html
            ) {
                """

                <summary><strong>Important Information</strong> - Click to read
                </summary>
                """
            }
        }

        @Test("Disclosure summary with icon renders correctly")
        func disclosureSummaryWithIconRendersCorrectly() {
            assertInlineSnapshot(
                of: Details {
                    DisclosureSummary {
                        HTMLText("▶ ")
                        HTMLText("Settings")
                    }
                    UnorderedList {
                        ListItem {
                            HTMLText("Theme: Dark")
                        }
                        ListItem {
                            HTMLText("Language: English")
                        }
                    }
                },
                as: .html
            ) {
                """

                <details>
                  <summary>▶ Settings
                  </summary>
                  <ul>
                    <li>Theme: Dark
                    </li>
                    <li>Language: English
                    </li>
                  </ul>
                </details>
                """
            }
        }

        @Test("Disclosure summary with link renders correctly")
        func disclosureSummaryWithLinkRendersCorrectly() {
            assertInlineSnapshot(
                of: Details {
                    DisclosureSummary {
                        HTMLText("Documentation (")
                        Anchor(href: "https://docs.example.com") {
                            HTMLText("external link")
                        }
                        HTMLText(")")
                    }
                    Paragraph {
                        HTMLText("Click the link above to view full documentation.")
                    }
                },
                as: .html
            ) {
                """

                <details>
                  <summary>Documentation (<a href="https://docs.example.com">external link</a>)
                  </summary>
                  <p>Click the link above to view full documentation.
                  </p>
                </details>
                """
            }
        }

        @Test("Disclosure summary with code renders correctly")
        func disclosureSummaryWithCodeRendersCorrectly() {
            assertInlineSnapshot(
                of: Details {
                    DisclosureSummary {
                        Code {
                            HTMLText("console.log()")
                        }
                        HTMLText(" function details")
                    }
                    Paragraph {
                        HTMLText("The console.log() function outputs a message to the web console.")
                    }
                },
                as: .html
            ) {
                """

                <details>
                  <summary><code>console.log()</code> function details
                  </summary>
                  <p>The console.log() function outputs a message to the web console.
                  </p>
                </details>
                """
            }
        }

        @Test("Multiple disclosure summaries in accordion renders correctly")
        func multipleDisclosureSummariesInAccordionRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    Details(name: .init("help")) {
                        DisclosureSummary {
                            HTMLText("Getting Started")
                        }
                        Paragraph {
                            HTMLText("Learn the basics of using our platform.")
                        }
                    }
                    Details(name: .init("help")) {
                        DisclosureSummary {
                            HTMLText("Advanced Features")
                        }
                        Paragraph {
                            HTMLText("Explore advanced functionality and customization options.")
                        }
                    }
                    Details(name: .init("help")) {
                        DisclosureSummary {
                            HTMLText("Troubleshooting")
                        }
                        Paragraph {
                            HTMLText("Common issues and their solutions.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <details name="help">
                    <summary>Getting Started
                    </summary>
                    <p>Learn the basics of using our platform.
                    </p>
                  </details>
                  <details name="help">
                    <summary>Advanced Features
                    </summary>
                    <p>Explore advanced functionality and customization options.
                    </p>
                  </details>
                  <details name="help">
                    <summary>Troubleshooting
                    </summary>
                    <p>Common issues and their solutions.
                    </p>
                  </details>
                </div>
                """
            }
        }

        @Test("Disclosure summary within HTMLDocument renders correctly")
        func disclosureSummaryWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Details(open: .init()) {
                        DisclosureSummary {
                            HTMLText("Terms and Conditions")
                        }
                        Paragraph {
                            HTMLText("By using this service, you agree to our terms.")
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
                  <summary>Terms and Conditions
                  </summary>
                  <p>By using this service, you agree to our terms.
                  </p>
                </details>
                  </body>
                </html>
                """
            }
        }
    }
}
