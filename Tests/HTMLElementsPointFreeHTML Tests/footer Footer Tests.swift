import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Footer Element Tests")
    struct FooterTests {
        @Test("Basic footer renders correctly")
        func basicFooterRendersCorrectly() {
            assertInlineSnapshot(
                of: Footer {
                    Paragraph {
                        HTMLText("© 2024 Company Name. All rights reserved.")
                    }
                },
                as: .html
            ) {
                """

                <footer>
                  <p>© 2024 Company Name. All rights reserved.
                  </p>
                </footer>
                """
            }
        }

        @Test("Footer with navigation renders correctly")
        func footerWithNavigationRendersCorrectly() {
            assertInlineSnapshot(
                of: Footer {
                    NavigationSection {
                        UnorderedList {
                            ListItem {
                                Anchor(href: "/privacy") {
                                    HTMLText("Privacy Policy")
                                }
                            }
                            ListItem {
                                Anchor(href: "/terms") {
                                    HTMLText("Terms of Service")
                                }
                            }
                            ListItem {
                                Anchor(href: "/contact") {
                                    HTMLText("Contact Us")
                                }
                            }
                        }
                    }
                    Paragraph {
                        HTMLText("© 2024 All rights reserved.")
                    }
                },
                as: .html
            ) {
                """

                <footer>
                  <nav>
                    <ul>
                      <li><a href="/privacy">Privacy Policy</a>
                      </li>
                      <li><a href="/terms">Terms of Service</a>
                      </li>
                      <li><a href="/contact">Contact Us</a>
                      </li>
                    </ul>
                  </nav>
                  <p>© 2024 All rights reserved.
                  </p>
                </footer>
                """
            }
        }

        @Test("Footer for article renders correctly")
        func footerForArticleRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    H1 {
                        HTMLText("Article Title")
                    }
                    Paragraph {
                        HTMLText("Article content goes here.")
                    }
                    Footer {
                        Paragraph {
                            HTMLText("Author: ")
                            Anchor(href: "/authors/john-doe") {
                                HTMLText("John Doe")
                            }
                        }
                        Paragraph {
                            HTMLText("Published: January 15, 2024")
                        }
                        Paragraph {
                            HTMLText("Tags: web development, HTML, CSS")
                        }
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <h1>Article Title
                  </h1>
                  <p>Article content goes here.
                  </p>
                  <footer>
                    <p>Author: <a href="/authors/john-doe">John Doe</a>
                    </p>
                    <p>Published: January 15, 2024
                    </p>
                    <p>Tags: web development, HTML, CSS
                    </p>
                  </footer>
                </article>
                """
            }
        }

        @Test("Footer with contact information renders correctly")
        func footerWithContactInformationRendersCorrectly() {
            assertInlineSnapshot(
                of: Footer {
                    Address {
                        StrongImportance {
                            HTMLText("Company Name")
                        }
                        //                    BR()
                        HTMLText("123 Main Street")
                        //                    BR()
                        HTMLText("City, State 12345")
                        //                    BR()
                        Anchor(href: "mailto:info@company.com") {
                            HTMLText("info@company.com")
                        }
                    }
                },
                as: .html
            ) {
                """

                <footer>
                  <address><strong>Company Name</strong>123 Main StreetCity, State 12345<a href="mailto:info@company.com">info@company.com</a>
                  </address>
                </footer>
                """
            }
        }

        @Test("Footer within HTMLDocument renders correctly")
        func footerWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Main {
                        Article {
                            H1 {
                                HTMLText("Page Content")
                            }
                            Paragraph {
                                HTMLText("Main content goes here.")
                            }
                        }
                    }
                    Footer {
                        ContentDivision {
                            ContentDivision {
                                H3 {
                                    HTMLText("Quick Links")
                                }
                                UnorderedList {
                                    ListItem {
                                        Anchor(href: "/about") {
                                            HTMLText("About Us")
                                        }
                                    }
                                    ListItem {
                                        Anchor(href: "/services") {
                                            HTMLText("Services")
                                        }
                                    }
                                }
                            }
                            ContentDivision {
                                Paragraph {
                                    HTMLText("© 2024 Company. All rights reserved.")
                                }
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
                <main>
                  <article>
                    <h1>Page Content
                    </h1>
                    <p>Main content goes here.
                    </p>
                  </article>
                </main>
                <footer>
                  <div>
                    <div>
                      <h3>Quick Links
                      </h3>
                      <ul>
                        <li><a href="/about">About Us</a>
                        </li>
                        <li><a href="/services">Services</a>
                        </li>
                      </ul>
                    </div>
                    <div>
                      <p>© 2024 Company. All rights reserved.
                      </p>
                    </div>
                  </div>
                </footer>
                  </body>
                </html>
                """
            }
        }
    }
}
