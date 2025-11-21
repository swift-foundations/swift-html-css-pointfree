import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Aside Element Tests")
    struct AsideTests {
        @Test("Basic aside renders correctly")
        func basicAsideRendersCorrectly() {
            assertInlineSnapshot(
                of: Aside {
                    H3 {
                        HTMLText("Related Information")
                    }
                    Paragraph {
                        HTMLText("This is additional information related to the main content.")
                    }
                },
                as: .html
            ) {
                """

                <aside>
                  <h3>Related Information
                  </h3>
                  <p>This is additional information related to the main content.
                  </p>
                </aside>
                """
            }
        }

        @Test("Aside with sidebar content renders correctly")
        func asideWithSidebarContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Aside {
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
                            Anchor(href: "/contact") {
                                HTMLText("Contact")
                            }
                        }
                        ListItem {
                            Anchor(href: "/faq") {
                                HTMLText("FAQ")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <aside>
                  <h3>Quick Links
                  </h3>
                  <ul>
                    <li><a href="/about">About Us</a>
                    </li>
                    <li><a href="/contact">Contact</a>
                    </li>
                    <li><a href="/faq">FAQ</a>
                    </li>
                  </ul>
                </aside>
                """
            }
        }

        @Test("Aside within article renders correctly")
        func asideWithinArticleRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    H1 {
                        HTMLText("The History of Web Development")
                    }
                    Paragraph {
                        HTMLText(
                            "Web development has evolved significantly over the past few decades."
                        )
                    }
                    Aside {
                        H4 {
                            HTMLText("Did You Know?")
                        }
                        Paragraph {
                            HTMLText("The first website was created in 1991 by Tim Berners-Lee.")
                        }
                    }
                    Paragraph {
                        HTMLText(
                            "From simple HTML pages to complex web applications, the field has grown tremendously."
                        )
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <h1>The History of Web Development
                  </h1>
                  <p>Web development has evolved significantly over the past few decades.
                  </p>
                  <aside>
                    <h4>Did You Know?
                    </h4>
                    <p>The first website was created in 1991 by Tim Berners-Lee.
                    </p>
                  </aside>
                  <p>From simple HTML pages to complex web applications, the field has grown tremendously.
                  </p>
                </article>
                """
            }
        }

        @Test("Aside with advertisement content renders correctly")
        func asideWithAdvertisementContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Aside {
                    H3 {
                        HTMLText("Sponsored Content")
                    }
                    ContentDivision {
                        Anchor(href: "https://sponsor.example.com") {
                            Image(
                                src: "ad-banner.jpg",
                                alt: "Visit our sponsor"
                            )
                        }
                    }
                    Small {
                        HTMLText("Advertisement - Learn more about our sponsor")
                    }
                },
                as: .html
            ) {
                """

                <aside>
                  <h3>Sponsored Content
                  </h3>
                  <div><a href="https://sponsor.example.com"><img alt="Visit our sponsor" src="ad-banner.jpg"></a>
                  </div><small>Advertisement - Learn more about our sponsor</small>
                </aside>
                """
            }
        }

        @Test("Aside with table of contents renders correctly")
        func asideWithTableOfContentsRendersCorrectly() {
            assertInlineSnapshot(
                of: Aside {
                    NavigationSection {
                        H3 {
                            HTMLText("In This Article")
                        }
                        OrderedList {
                            ListItem {
                                Anchor(href: "#introduction") {
                                    HTMLText("Introduction")
                                }
                            }
                            ListItem {
                                Anchor(href: "#getting-started") {
                                    HTMLText("Getting Started")
                                }
                            }
                            ListItem {
                                Anchor(href: "#advanced-topics") {
                                    HTMLText("Advanced Topics")
                                }
                            }
                            ListItem {
                                Anchor(href: "#conclusion") {
                                    HTMLText("Conclusion")
                                }
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <aside>
                  <nav>
                    <h3>In This Article
                    </h3>
                    <ol>
                      <li><a href="#introduction">Introduction</a>
                      </li>
                      <li><a href="#getting-started">Getting Started</a>
                      </li>
                      <li><a href="#advanced-topics">Advanced Topics</a>
                      </li>
                      <li><a href="#conclusion">Conclusion</a>
                      </li>
                    </ol>
                  </nav>
                </aside>
                """
            }
        }

        @Test("Aside within HTMLDocument renders correctly")
        func asideWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Main {
                        Article {
                            Header {
                                H1 {
                                    HTMLText("Complete Guide to HTML5")
                                }
                            }
                            Section {
                                H2 {
                                    HTMLText("Semantic Elements")
                                }
                                Paragraph {
                                    HTMLText(
                                        "HTML5 introduced many new semantic elements that provide meaning to web content."
                                    )
                                }
                            }
                        }
                        Aside {
                            Section {
                                H3 {
                                    HTMLText("Related Articles")
                                }
                                UnorderedList {
                                    ListItem {
                                        Anchor(href: "/css3-guide") {
                                            HTMLText("CSS3 Complete Guide")
                                        }
                                    }
                                    ListItem {
                                        Anchor(href: "/javascript-basics") {
                                            HTMLText("JavaScript Fundamentals")
                                        }
                                    }
                                }
                            }
                            Section {
                                H3 {
                                    HTMLText("Stay Updated")
                                }
                                Paragraph {
                                    HTMLText(
                                        "Subscribe to our newsletter for the latest web development tips."
                                    )
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
                      <h1>Complete Guide to HTML5
                      </h1>
                    </header>
                    <section>
                      <h2>Semantic Elements
                      </h2>
                      <p>HTML5 introduced many new semantic elements that provide meaning to web content.
                      </p>
                    </section>
                  </article>
                  <aside>
                    <section>
                      <h3>Related Articles
                      </h3>
                      <ul>
                        <li><a href="/css3-guide">CSS3 Complete Guide</a>
                        </li>
                        <li><a href="/javascript-basics">JavaScript Fundamentals</a>
                        </li>
                      </ul>
                    </section>
                    <section>
                      <h3>Stay Updated
                      </h3>
                      <p>Subscribe to our newsletter for the latest web development tips.
                      </p>
                    </section>
                  </aside>
                </main>
                  </body>
                </html>
                """
            }
        }
    }
}
