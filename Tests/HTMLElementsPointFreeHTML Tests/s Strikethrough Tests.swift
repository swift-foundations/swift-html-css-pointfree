import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Strikethrough Element Tests")
    struct StrikethroughTests {
        @Test("Basic s renders correctly")
        func basicSRendersCorrectly() {
            assertInlineSnapshot(
                of: Strikethrough {
                    HTMLText("This text is no longer accurate")
                },
                as: .html
            ) {
                """

                <s>This text is no longer accurate
                </s>
                """
            }
        }

        @Test("S with price correction renders correctly")
        func sWithPriceCorrectionRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Original price: ")
                    Strikethrough {
                        HTMLText("$99.99")
                    }
                    HTMLText(" Now only $79.99!")
                },
                as: .html
            ) {
                """

                <p>Original price: 
                  <s>$99.99
                  </s> Now only $79.99!
                </p>
                """
            }
        }

        @Test("S with outdated information renders correctly")
        func sWithOutdatedInformationRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The event was scheduled for ")
                    Strikethrough {
                        HTMLText("March 15th")
                    }
                    HTMLText(" ")
                    StrongImportance {
                        HTMLText("March 22nd")
                    }
                    HTMLText(" due to scheduling conflicts.")
                },
                as: .html
            ) {
                """

                <p>The event was scheduled for 
                  <s>March 15th
                  </s> <strong>March 22nd</strong> due to scheduling conflicts.
                </p>
                """
            }
        }

        @Test("S with nested formatting renders correctly")
        func sWithNestedFormattingRendersCorrectly() {
            assertInlineSnapshot(
                of: Strikethrough {
                    StrongImportance {
                        HTMLText("SOLD OUT")
                    }
                    HTMLText(" - ")
                    Emphasis {
                        HTMLText("This item is no longer available")
                    }
                },
                as: .html
            ) {
                """

                <s><strong>SOLD OUT</strong> - <em>This item is no longer available</em>
                </s>
                """
            }
        }

        @Test("S with class styling renders correctly")
        func sWithClassStylingRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Product status: ")
                    Strikethrough {
                        HTMLText("Available")
                    }
                    HTMLText(" - Discontinued")
                },
                as: .html
            ) {
                """

                <p>Product status: 
                  <s>Available
                  </s> - Discontinued
                </p>
                """
            }
        }

        @Test("Strikethrough within HTMLDocument renders correctly")
        func strikethroughWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Product Updates")
                        }
                        Section {
                            H3 {
                                HTMLText("Pricing Changes")
                            }
                            UnorderedList {
                                ListItem {
                                    HTMLText("Basic Plan: ")
                                    Strikethrough {
                                        HTMLText("$9.99/month")
                                    }
                                    HTMLText(" now $7.99/month")
                                }
                                ListItem {
                                    HTMLText("Premium Plan: ")
                                    Strikethrough {
                                        HTMLText("$19.99/month")
                                    }
                                    HTMLText(" now $14.99/month")
                                }
                                ListItem {
                                    HTMLText("Enterprise Plan: ")
                                    Strikethrough {
                                        HTMLText("$49.99/month")
                                    }
                                    HTMLText(" now $39.99/month")
                                }
                            }
                        }
                        Section {
                            H3 {
                                HTMLText("Feature Updates")
                            }
                            Paragraph {
                                Strikethrough {
                                    HTMLText("Beta feature X is now deprecated.")
                                }
                                HTMLText(
                                    " Feature X has been officially released and is available to all users."
                                )
                            }
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
                  <h2>Product Updates
                  </h2>
                  <section>
                    <h3>Pricing Changes
                    </h3>
                    <ul>
                      <li>Basic Plan: 
                        <s>$9.99/month
                        </s> now $7.99/month
                      </li>
                      <li>Premium Plan: 
                        <s>$19.99/month
                        </s> now $14.99/month
                      </li>
                      <li>Enterprise Plan: 
                        <s>$49.99/month
                        </s> now $39.99/month
                      </li>
                    </ul>
                  </section>
                  <section>
                    <h3>Feature Updates
                    </h3>
                    <p>
                      <s>Beta feature X is now deprecated.
                      </s> Feature X has been officially released and is available to all users.
                    </p>
                  </section>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
