import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct MainTests {
        @Test("Basic main renders correctly")
        func basicMainRendersCorrectly() {
            assertInlineSnapshot(
                of: Main {
                    H1 {
                        HTMLText("Welcome")
                    }
                    Paragraph {
                        HTMLText("This is the main content of the page.")
                    }
                },
                as: .html
            ) {
                """

                <main>
                  <h1>Welcome
                  </h1>
                  <p>This is the main content of the page.
                  </p>
                </main>
                """
            }
        }

        @Test("Main with article content renders correctly")
        func mainWithArticleContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Main {
                    Article {
                        Header {
                            H1 {
                                HTMLText("Blog Post Title")
                            }
                            Paragraph {
                                HTMLText("Published on January 15, 2024")
                            }
                        }
                        Paragraph {
                            HTMLText("This is the main content of the blog post.")
                        }
                        Footer {
                            Paragraph {
                                HTMLText("Tags: web development, HTML")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <main>
                  <article>
                    <header>
                      <h1>Blog Post Title
                      </h1>
                      <p>Published on January 15, 2024
                      </p>
                    </header>
                    <p>This is the main content of the blog post.
                    </p>
                    <footer>
                      <p>Tags: web development, HTML
                      </p>
                    </footer>
                  </article>
                </main>
                """
            }
        }

        @Test("Main with multiple sections renders correctly")
        func mainWithMultipleSectionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Main {
                    Section {
                        H2 {
                            HTMLText("Overview")
                        }
                        Paragraph {
                            HTMLText("This section provides an overview.")
                        }
                    }
                    Section {
                        H2 {
                            HTMLText("Details")
                        }
                        Paragraph {
                            HTMLText("This section contains detailed information.")
                        }
                    }
                    Section {
                        H2 {
                            HTMLText("Conclusion")
                        }
                        Paragraph {
                            HTMLText("This section concludes the content.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <main>
                  <section>
                    <h2>Overview
                    </h2>
                    <p>This section provides an overview.
                    </p>
                  </section>
                  <section>
                    <h2>Details
                    </h2>
                    <p>This section contains detailed information.
                    </p>
                  </section>
                  <section>
                    <h2>Conclusion
                    </h2>
                    <p>This section concludes the content.
                    </p>
                  </section>
                </main>
                """
            }
        }

        @Test("Main with aside content renders correctly")
        func mainWithAsideContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Main {
                    Article {
                        H1 {
                            HTMLText("Main Article")
                        }
                        Paragraph {
                            HTMLText("This is the primary content of the article.")
                        }
                        Aside {
                            H2 {
                                HTMLText("Related Information")
                            }
                            Paragraph {
                                HTMLText("This is tangentially related content.")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <main>
                  <article>
                    <h1>Main Article
                    </h1>
                    <p>This is the primary content of the article.
                    </p>
                    <aside>
                      <h2>Related Information
                      </h2>
                      <p>This is tangentially related content.
                      </p>
                    </aside>
                  </article>
                </main>
                """
            }
        }

        @Test("Main within HTMLDocument renders correctly")
        func mainWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Header {
                        H1 {
                            HTMLText("Site Title")
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
                            }
                        }
                    }
                    Main {
                        Article {
                            H1 {
                                HTMLText("Page Title")
                            }
                            Paragraph {
                                HTMLText("This is the main content area of the webpage.")
                            }
                        }
                    }
                    Footer {
                        Paragraph {
                            HTMLText("© 2024 Website Name")
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
                  <h1>Site Title
                  </h1>
                  <nav>
                    <ul>
                      <li><a href="/">Home</a>
                      </li>
                      <li><a href="/about">About</a>
                      </li>
                    </ul>
                  </nav>
                </header>
                <main>
                  <article>
                    <h1>Page Title
                    </h1>
                    <p>This is the main content area of the webpage.
                    </p>
                  </article>
                </main>
                <footer>
                  <p>© 2024 Website Name
                  </p>
                </footer>
                  </body>
                </html>
                """
            }
        }
    }
}
