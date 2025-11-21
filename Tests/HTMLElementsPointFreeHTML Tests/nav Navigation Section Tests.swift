import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct NavigationSectionTests {
        @Test("Basic nav renders correctly")
        func basicNavRendersCorrectly() {
            assertInlineSnapshot(
                of: NavigationSection {
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
                    }
                },
                as: .html
            ) {
                """

                <nav>
                  <ul>
                    <li><a href="/">Home</a>
                    </li>
                    <li><a href="/about">About</a>
                    </li>
                  </ul>
                </nav>
                """
            }
        }

        @Test("Nav with breadcrumb navigation renders correctly")
        func navWithBreadcrumbNavigationRendersCorrectly() {
            assertInlineSnapshot(
                of: NavigationSection {
                    OrderedList {
                        ListItem {
                            Anchor(href: "/") {
                                HTMLText("Home")
                            }
                        }
                        ListItem {
                            Anchor(href: "/products") {
                                HTMLText("Products")
                            }
                        }
                        ListItem {
                            HTMLText("Laptops")
                        }
                    }
                },
                as: .html
            ) {
                """

                <nav>
                  <ol>
                    <li><a href="/">Home</a>
                    </li>
                    <li><a href="/products">Products</a>
                    </li>
                    <li>Laptops
                    </li>
                  </ol>
                </nav>
                """
            }
        }

        @Test("Nav with primary navigation renders correctly")
        func navWithPrimaryNavigationRendersCorrectly() {
            assertInlineSnapshot(
                of: NavigationSection {
                    UnorderedList {
                        ListItem {
                            Anchor(href: "/") {
                                HTMLText("Home")
                            }
                        }
                        ListItem {
                            Anchor(href: "/services") {
                                HTMLText("Services")
                            }
                        }
                        ListItem {
                            Anchor(href: "/portfolio") {
                                HTMLText("Portfolio")
                            }
                        }
                        ListItem {
                            Anchor(href: "/contact") {
                                HTMLText("Contact")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <nav>
                  <ul>
                    <li><a href="/">Home</a>
                    </li>
                    <li><a href="/services">Services</a>
                    </li>
                    <li><a href="/portfolio">Portfolio</a>
                    </li>
                    <li><a href="/contact">Contact</a>
                    </li>
                  </ul>
                </nav>
                """
            }
        }

        @Test("Nav with nested navigation renders correctly")
        func navWithNestedNavigationRendersCorrectly() {
            assertInlineSnapshot(
                of: NavigationSection {
                    UnorderedList {
                        ListItem {
                            Anchor(href: "/products") {
                                HTMLText("Products")
                            }
                            UnorderedList {
                                ListItem {
                                    Anchor(href: "/products/laptops") {
                                        HTMLText("Laptops")
                                    }
                                }
                                ListItem {
                                    Anchor(href: "/products/desktops") {
                                        HTMLText("Desktops")
                                    }
                                }
                            }
                        }
                        ListItem {
                            Anchor(href: "/support") {
                                HTMLText("Support")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <nav>
                  <ul>
                    <li><a href="/products">Products</a>
                      <ul>
                        <li><a href="/products/laptops">Laptops</a>
                        </li>
                        <li><a href="/products/desktops">Desktops</a>
                        </li>
                      </ul>
                    </li>
                    <li><a href="/support">Support</a>
                    </li>
                  </ul>
                </nav>
                """
            }
        }

        @Test("Nav with table of contents renders correctly")
        func navWithTableOfContentsRendersCorrectly() {
            assertInlineSnapshot(
                of: NavigationSection {
                    H2 {
                        HTMLText("Table of Contents")
                    }
                    OrderedList {
                        ListItem {
                            Anchor(href: "#introduction") {
                                HTMLText("Introduction")
                            }
                        }
                        ListItem {
                            Anchor(href: "#methodology") {
                                HTMLText("Methodology")
                            }
                        }
                        ListItem {
                            Anchor(href: "#results") {
                                HTMLText("Results")
                            }
                        }
                        ListItem {
                            Anchor(href: "#conclusion") {
                                HTMLText("Conclusion")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <nav>
                  <h2>Table of Contents
                  </h2>
                  <ol>
                    <li><a href="#introduction">Introduction</a>
                    </li>
                    <li><a href="#methodology">Methodology</a>
                    </li>
                    <li><a href="#results">Results</a>
                    </li>
                    <li><a href="#conclusion">Conclusion</a>
                    </li>
                  </ol>
                </nav>
                """
            }
        }

        @Test("NavigationSection within HTMLDocument renders correctly")
        func navigationSectionWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Header {
                        ContentDivision {
                            Anchor(href: "/") {
                                HTMLText("Company Logo")
                            }
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
                                    Anchor(href: "/services") {
                                        HTMLText("Services")
                                    }
                                }
                                ListItem {
                                    Anchor(href: "/contact") {
                                        HTMLText("Contact")
                                    }
                                }
                            }
                        }
                    }
                    Main {
                        Article {
                            H1 {
                                HTMLText("Page Content")
                            }
                            Paragraph {
                                HTMLText("This is the main content of the page.")
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
                  <div><a href="/">Company Logo</a>
                  </div>
                  <nav>
                    <ul>
                      <li><a href="/">Home</a>
                      </li>
                      <li><a href="/about">About</a>
                      </li>
                      <li><a href="/services">Services</a>
                      </li>
                      <li><a href="/contact">Contact</a>
                      </li>
                    </ul>
                  </nav>
                </header>
                <main>
                  <article>
                    <h1>Page Content
                    </h1>
                    <p>This is the main content of the page.
                    </p>
                  </article>
                </main>
                  </body>
                </html>
                """
            }
        }
    }
}
