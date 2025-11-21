import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Article Element Tests")
    struct ArticleTests {
        @Test("Basic article renders correctly")
        func basicArticleRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    H1 {
                        HTMLText("Article Title")
                    }
                    Paragraph {
                        HTMLText("Article content goes here.")
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
                </article>
                """
            }
        }

        @Test("Article with header and footer renders correctly")
        func articleWithHeaderAndFooterRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    Header {
                        H1 {
                            HTMLText("News Article")
                        }
                        Paragraph {
                            HTMLText("Published on January 1, 2024")
                        }
                    }
                    Paragraph {
                        HTMLText("This is the main content of the news article.")
                    }
                    Footer {
                        Paragraph {
                            HTMLText("Author: John Doe")
                        }
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <header>
                    <h1>News Article
                    </h1>
                    <p>Published on January 1, 2024
                    </p>
                  </header>
                  <p>This is the main content of the news article.
                  </p>
                  <footer>
                    <p>Author: John Doe
                    </p>
                  </footer>
                </article>
                """
            }
        }

        @Test("Article with multiple sections renders correctly")
        func articleWithMultipleSectionsRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    H1 {
                        HTMLText("Complete Guide")
                    }
                    Section {
                        H2 {
                            HTMLText("Introduction")
                        }
                        Paragraph {
                            HTMLText("This section introduces the topic.")
                        }
                    }
                    Section {
                        H2 {
                            HTMLText("Main Content")
                        }
                        Paragraph {
                            HTMLText("This section contains the main content.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <h1>Complete Guide
                  </h1>
                  <section>
                    <h2>Introduction
                    </h2>
                    <p>This section introduces the topic.
                    </p>
                  </section>
                  <section>
                    <h2>Main Content
                    </h2>
                    <p>This section contains the main content.
                    </p>
                  </section>
                </article>
                """
            }
        }

        @Test("Nested articles render correctly")
        func nestedArticlesRenderCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    H1 {
                        HTMLText("Blog Post")
                    }
                    Paragraph {
                        HTMLText("This is the main blog post content.")
                    }
                    Article {
                        H2 {
                            HTMLText("Comment")
                        }
                        Paragraph {
                            HTMLText("This is a comment on the blog post.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <h1>Blog Post
                  </h1>
                  <p>This is the main blog post content.
                  </p>
                  <article>
                    <h2>Comment
                    </h2>
                    <p>This is a comment on the blog post.
                    </p>
                  </article>
                </article>
                """
            }
        }

        @Test("Article within HTMLDocument renders correctly")
        func articleWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Main {
                        Article {
                            Header {
                                H1 {
                                    HTMLText("Technical Article")
                                }
                                Paragraph {
                                    Time(datetime: "2024-01-15") {
                                        HTMLText("January 15, 2024")
                                    }
                                }
                            }
                            Paragraph {
                                HTMLText(
                                    "This article discusses modern web development techniques."
                                )
                            }
                            Footer {
                                Paragraph {
                                    HTMLText("Tags: web development, HTML, CSS")
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
                      <h1>Technical Article
                      </h1>
                      <p><time datetime="2024-01-15">January 15, 2024</time>
                      </p>
                    </header>
                    <p>This article discusses modern web development techniques.
                    </p>
                    <footer>
                      <p>Tags: web development, HTML, CSS
                      </p>
                    </footer>
                  </article>
                </main>
                  </body>
                </html>
                """
            }
        }
    }
}
