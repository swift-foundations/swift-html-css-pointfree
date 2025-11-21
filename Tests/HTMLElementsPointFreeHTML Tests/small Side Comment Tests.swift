import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Small Element Tests")
    struct SmallTests {
        @Test("Basic small renders correctly")
        func basicSmallRendersCorrectly() {
            assertInlineSnapshot(
                of: Small {
                    HTMLText("Fine print")
                },
                as: .html
            ) {
                """
                <small>Fine print</small>
                """
            }
        }

        @Test("Small for copyright notice renders correctly")
        func smallForCopyrightNoticeRendersCorrectly() {
            assertInlineSnapshot(
                of: Footer {
                    Paragraph {
                        Small {
                            HTMLText("© 2024 Company Name. All rights reserved.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <footer>
                  <p><small>© 2024 Company Name. All rights reserved.</small>
                  </p>
                </footer>
                """
            }
        }

        @Test("Small for disclaimers renders correctly")
        func smallForDisclaimersRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    Paragraph {
                        HTMLText("Get up to 50% off selected items!")
                    }
                    Small {
                        HTMLText(
                            "*Offer valid until December 31, 2024. Terms and conditions apply. Cannot be combined with other offers."
                        )
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <p>Get up to 50% off selected items!
                  </p><small>*Offer valid until December 31, 2024. Terms and conditions apply. Cannot be combined with other offers.</small>
                </div>
                """
            }
        }

        @Test("Small for side comments renders correctly")
        func smallForSideCommentsRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    H2 {
                        HTMLText("Product Review")
                    }
                    Paragraph {
                        HTMLText("This product exceeded my expectations. ")
                        Small {
                            HTMLText("(Based on 3 months of usage)")
                        }
                    }
                    Paragraph {
                        HTMLText("The build quality is excellent and worth the price. ")
                        Small {
                            HTMLText("(Compared to similar products in this price range)")
                        }
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <h2>Product Review
                  </h2>
                  <p>This product exceeded my expectations. <small>(Based on 3 months of usage)</small>
                  </p>
                  <p>The build quality is excellent and worth the price. <small>(Compared to similar products in this price range)</small>
                  </p>
                </article>
                """
            }
        }

        @Test("Small with nested elements renders correctly")
        func smallWithNestedElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: Small {
                    HTMLText("Last updated: ")
                    Time(datetime: "2024-01-15") {
                        HTMLText("January 15, 2024")
                    }
                    HTMLText(" by ")
                    Anchor(href: "/authors/john-doe") {
                        HTMLText("John Doe")
                    }
                },
                as: .html
            ) {
                """
                <small>Last updated: <time datetime="2024-01-15">January 15, 2024</time> by <a href="/authors/john-doe">John Doe</a></small>
                """
            }
        }

        @Test("Small within HTMLDocument renders correctly")
        func smallWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Main {
                        Article {
                            Header {
                                H1 {
                                    HTMLText("Website Terms of Service")
                                }
                                Small {
                                    HTMLText("Last updated: January 1, 2024")
                                }
                            }
                            Section {
                                H2 {
                                    HTMLText("Acceptance of Terms")
                                }
                                Paragraph {
                                    HTMLText(
                                        "By accessing and using this website, you accept and agree to be bound by the terms and provision of this agreement."
                                    )
                                }
                            }
                            Footer {
                                Small {
                                    HTMLText(
                                        "This document is legally binding. Please read carefully before using our services."
                                    )
                                }
                            }
                        }
                    }
                    Footer {
                        Small {
                            Anchor(href: "/privacy") {
                                HTMLText("Privacy Policy")
                            }
                            HTMLText(" | ")
                            Anchor(href: "/terms") {
                                HTMLText("Terms of Service")
                            }
                            HTMLText(" | © 2024 Website Name")
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
                <main>
                  <article>
                    <header>
                      <h1>Website Terms of Service
                      </h1><small>Last updated: January 1, 2024</small>
                    </header>
                    <section>
                      <h2>Acceptance of Terms
                      </h2>
                      <p>By accessing and using this website, you accept and agree to be bound by the terms and provision of this agreement.
                      </p>
                    </section>
                    <footer><small>This document is legally binding. Please read carefully before using our services.</small>
                    </footer>
                  </article>
                </main>
                <footer><small><a href="/privacy">Privacy Policy</a> | <a href="/terms">Terms of Service</a> | © 2024 Website Name</small>
                </footer>
                  </body>
                </html>
                """
            }
        }
    }
}
