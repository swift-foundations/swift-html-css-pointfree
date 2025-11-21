import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Address Element Tests")
    struct AddressTests {
        @Test("Basic address renders correctly")
        func basicAddressRendersCorrectly() {
            assertInlineSnapshot(
                of: Address {
                    HTMLText("123 Main Street")
                    BR()()
                    HTMLText("Anytown, ST 12345")
                },
                as: .html
            ) {
                """

                <address>123 Main Street<br>Anytown, ST 12345
                </address>
                """
            }
        }

        @Test("Address with contact information renders correctly")
        func addressWithContactInformationRendersCorrectly() {

            assertInlineSnapshot(
                of: Address {
                    StrongImportance {
                        HTMLText("Company Name")
                    }
                    BR()()
                    HTMLText("123 Business Ave")
                    BR()()
                    HTMLText("City, State 12345")
                    BR()()
                    Anchor(href: "tel:+1234567890") {
                        HTMLText("(123) 456-7890")
                    }
                    BR()()
                    Anchor(href: "mailto:info@company.com") {
                        HTMLText("info@company.com")
                    }
                },
                as: .html
            ) {
                """

                <address><strong>Company Name</strong><br>123 Business Ave<br>City, State 12345<br><a href="tel:+1234567890">(123) 456-7890</a><br><a href="mailto:info@company.com">info@company.com</a>
                </address>
                """
            }
        }

        @Test("Address for article author renders correctly")
        func addressForArticleAuthorRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    H1 {
                        HTMLText("Web Development Best Practices")
                    }
                    Paragraph {
                        HTMLText(
                            "This article covers the essential best practices for modern web development."
                        )
                    }
                    Footer {
                        Paragraph {
                            HTMLText("Written by:")
                        }
                        Address {
                            Anchor(href: "mailto:john.doe@example.com") {
                                HTMLText("John Doe")
                            }
                            //                        BR()
                            Anchor(href: "https://johndoe.dev") {
                                HTMLText("johndoe.dev")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <h1>Web Development Best Practices
                  </h1>
                  <p>This article covers the essential best practices for modern web development.
                  </p>
                  <footer>
                    <p>Written by:
                    </p>
                    <address><a href="mailto:john.doe@example.com">John Doe</a><a href="https://johndoe.dev">johndoe.dev</a>
                    </address>
                  </footer>
                </article>
                """
            }
        }

        @Test("Address with multiple formats renders correctly")
        func addressWithMultipleFormatsRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    H2 {
                        HTMLText("Contact Information")
                    }
                    ContentDivision {
                        H3 {
                            HTMLText("Mailing Address")
                        }
                        Address {
                            HTMLText("Tech Solutions Inc.")
                            //                        BR()
                            HTMLText("456 Innovation Drive")
                            //                        BR()
                            HTMLText("Suite 100")
                            //                        BR()
                            HTMLText("Tech City, TC 54321")
                        }
                    }
                    ContentDivision {
                        H3 {
                            HTMLText("Contact Details")
                        }
                        Address {
                            Paragraph {
                                HTMLText("Phone: ")
                                Anchor(href: "tel:+15551234567") {
                                    HTMLText("+1 (555) 123-4567")
                                }
                            }
                            Paragraph {
                                HTMLText("Email: ")
                                Anchor(href: "mailto:contact@techsolutions.com") {
                                    HTMLText("contact@techsolutions.com")
                                }
                            }
                            Paragraph {
                                HTMLText("Website: ")
                                Anchor(href: "https://techsolutions.com") {
                                    HTMLText("techsolutions.com")
                                }
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <h2>Contact Information
                  </h2>
                  <div>
                    <h3>Mailing Address
                    </h3>
                    <address>Tech Solutions Inc.456 Innovation DriveSuite 100Tech City, TC 54321
                    </address>
                  </div>
                  <div>
                    <h3>Contact Details
                    </h3>
                    <address>
                      <p>Phone: <a href="tel:+15551234567">+1 (555) 123-4567</a>
                      </p>
                      <p>Email: <a href="mailto:contact@techsolutions.com">contact@techsolutions.com</a>
                      </p>
                      <p>Website: <a href="https://techsolutions.com">techsolutions.com</a>
                      </p>
                    </address>
                  </div>
                </div>
                """
            }
        }

        @Test("Address within HTMLDocument renders correctly")
        func addressWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Main {
                        Article {
                            Header {
                                H1 {
                                    HTMLText("About Our Company")
                                }
                            }
                            Section {
                                Paragraph {
                                    HTMLText(
                                        "We are a technology company focused on innovative solutions."
                                    )
                                }
                            }
                            Footer {
                                Address {
                                    StrongImportance {
                                        HTMLText("Headquarters:")
                                    }
                                    //                                BR()
                                    HTMLText("Innovation Labs")
                                    //                                BR()
                                    HTMLText("789 Future Blvd")
                                    //                                BR()
                                    HTMLText("Tomorrow City, TC 98765")
                                    //                                BR()
                                    //                                BR()
                                    StrongImportance {
                                        HTMLText("Contact:")
                                    }
                                    //                                BR()
                                    Anchor(href: "tel:+19876543210") {
                                        HTMLText("Phone: (987) 654-3210")
                                    }
                                    //                                BR()
                                    Anchor(href: "mailto:hello@innovationlabs.com") {
                                        HTMLText("Email: hello@innovationlabs.com")
                                    }
                                }
                            }
                        }
                    }
                    Footer {
                        Address {
                            Small {
                                HTMLText("© 2024 Innovation Labs. All rights reserved.")
                                //                            BR()
                                Anchor(href: "/privacy") {
                                    HTMLText("Privacy Policy")
                                }
                                HTMLText(" | ")
                                Anchor(href: "/terms") {
                                    HTMLText("Terms of Service")
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
                    <header>
                      <h1>About Our Company
                      </h1>
                    </header>
                    <section>
                      <p>We are a technology company focused on innovative solutions.
                      </p>
                    </section>
                    <footer>
                      <address><strong>Headquarters:</strong>Innovation Labs789 Future BlvdTomorrow City, TC 98765<strong>Contact:</strong><a href="tel:+19876543210">Phone: (987) 654-3210</a><a href="mailto:hello@innovationlabs.com">Email: hello@innovationlabs.com</a>
                      </address>
                    </footer>
                  </article>
                </main>
                <footer>
                  <address><small>© 2024 Innovation Labs. All rights reserved.<a href="/privacy">Privacy Policy</a> | <a href="/terms">Terms of Service</a></small>
                  </address>
                </footer>
                  </body>
                </html>
                """
            }
        }
    }
}
