import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Header Element Tests")
    struct HeaderTests {
        @Test("Basic header renders correctly")
        func basicHeaderRendersCorrectly() {
            assertInlineSnapshot(
                of: Header {
                    H1 {
                        HTMLText("Site Title")
                    }
                },
                as: .html
            ) {
                """

                <header>
                  <h1>Site Title
                  </h1>
                </header>
                """
            }
        }

        @Test("Header with navigation renders correctly")
        func headerWithNavigationRendersCorrectly() {
            assertInlineSnapshot(
                of: Header {
                    H1 {
                        HTMLText("My Website")
                    }
                    NavigationSection {
                        UnorderedList {
                            ListItem {
                                Anchor(href: "/") {
                                    HTMLText("Home")
                                }
                            }
                            ListItem {
                                Anchor(href: "/about") {
                                    HTMLText("About")
                                }
                            }
                            ListItem {
                                Anchor(href: "/contact") {
                                    HTMLText("Contact")
                                }
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <header>
                  <h1>My Website
                  </h1>
                  <nav>
                    <ul>
                      <li><a href="/">Home</a>
                      </li>
                      <li><a href="/about">About</a>
                      </li>
                      <li><a href="/contact">Contact</a>
                      </li>
                    </ul>
                  </nav>
                </header>
                """
            }
        }

        @Test("Header for article renders correctly")
        func headerForArticleRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    Header {
                        H1 {
                            HTMLText("Article Title")
                        }
                        Paragraph {
                            HTMLText("Published on ")
                            Time(datetime: "2024-01-15") {
                                HTMLText("January 15, 2024")
                            }
                            HTMLText(" by John Doe")
                        }
                    }
                    Paragraph {
                        HTMLText("Article content goes here.")
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <header>
                    <h1>Article Title
                    </h1>
                    <p>Published on <time datetime="2024-01-15">January 15, 2024</time> by John Doe
                    </p>
                  </header>
                  <p>Article content goes here.
                  </p>
                </article>
                """
            }
        }

        @Test("Header with multiple headings renders correctly")
        func headerWithMultipleHeadingsRendersCorrectly() {
            assertInlineSnapshot(
                of: Header {
                    H1 {
                        HTMLText("Main Title")
                    }
                    H2 {
                        HTMLText("Subtitle")
                    }
                    Paragraph {
                        HTMLText("Additional header information")
                    }
                },
                as: .html
            ) {
                """

                <header>
                  <h1>Main Title
                  </h1>
                  <h2>Subtitle
                  </h2>
                  <p>Additional header information
                  </p>
                </header>
                """
            }
        }

        @Test("Header within HTMLDocument renders correctly")
        func headerWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Header {
                        ContentDivision {
                            H1 {
                                Anchor(href: "/") {
                                    HTMLText("Company Name")
                                }
                            }
                            NavigationSection {
                                UnorderedList {
                                    ListItem {
                                        Anchor(href: "/products") {
                                            HTMLText("Products")
                                        }
                                    }
                                    ListItem {
                                        Anchor(href: "/services") {
                                            HTMLText("Services")
                                        }
                                    }
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
                <header>
                  <div>
                    <h1><a href="/">Company Name</a>
                    </h1>
                    <nav>
                      <ul>
                        <li><a href="/products">Products</a>
                        </li>
                        <li><a href="/services">Services</a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                </header>
                  </body>
                </html>
                """
            }
        }
    }
}
