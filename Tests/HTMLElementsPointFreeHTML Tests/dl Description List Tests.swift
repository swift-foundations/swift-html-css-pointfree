import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Description List Element Tests")
    struct DescriptionListTests {
        @Test("Basic description list renders correctly")
        func basicDescriptionListRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("HTML")
                    }
                    DescriptionDetails {
                        HTMLText("HyperText Markup Language")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>HTML
                  </dt>
                  <dd>HyperText Markup Language
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description list with multiple terms renders correctly")
        func descriptionListWithMultipleTermsRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("Frontend")
                    }
                    DescriptionDetails {
                        HTMLText("The client-side part of a web application")
                    }
                    DescriptionTerm {
                        HTMLText("Backend")
                    }
                    DescriptionDetails {
                        HTMLText("The server-side part of a web application")
                    }
                    DescriptionTerm {
                        HTMLText("Database")
                    }
                    DescriptionDetails {
                        HTMLText("System for storing and organizing data")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>Frontend
                  </dt>
                  <dd>The client-side part of a web application
                  </dd>
                  <dt>Backend
                  </dt>
                  <dd>The server-side part of a web application
                  </dd>
                  <dt>Database
                  </dt>
                  <dd>System for storing and organizing data
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description list with multiple definitions per term renders correctly")
        func descriptionListWithMultipleDefinitionsPerTermRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("JavaScript")
                    }
                    DescriptionDetails {
                        HTMLText("A high-level programming language")
                    }
                    DescriptionDetails {
                        HTMLText("Originally designed for web browsers")
                    }
                    DescriptionDetails {
                        HTMLText("Now used for server-side development too")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>JavaScript
                  </dt>
                  <dd>A high-level programming language
                  </dd>
                  <dd>Originally designed for web browsers
                  </dd>
                  <dd>Now used for server-side development too
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description list with complex content renders correctly")
        func descriptionListWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        StrongImportance {
                            HTMLText("React")
                        }
                    }
                    DescriptionDetails {
                        Paragraph {
                            HTMLText("A JavaScript library for building user interfaces.")
                        }
                        Paragraph {
                            HTMLText("Developed by Facebook and maintained by Meta.")
                        }
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt><strong>React</strong>
                  </dt>
                  <dd>
                    <p>A JavaScript library for building user interfaces.
                    </p>
                    <p>Developed by Facebook and maintained by Meta.
                    </p>
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description list with links renders correctly")
        func descriptionListWithLinksRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("GitHub")
                    }
                    DescriptionDetails {
                        HTMLText("A platform for version control and collaboration. Visit ")
                        Anchor(href: "https://github.com") {
                            HTMLText("github.com")
                        }
                        HTMLText(" to learn more.")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>GitHub
                  </dt>
                  <dd>A platform for version control and collaboration. Visit <a href="https://github.com">github.com</a> to learn more.
                  </dd>
                </dl>
                """
            }
        }

        @Test("Nested description lists render correctly")
        func nestedDescriptionListsRenderCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("Programming Languages")
                    }
                    DescriptionDetails {
                        DescriptionList {
                            DescriptionTerm {
                                HTMLText("Swift")
                            }
                            DescriptionDetails {
                                HTMLText("iOS and macOS development")
                            }
                            DescriptionTerm {
                                HTMLText("JavaScript")
                            }
                            DescriptionDetails {
                                HTMLText("Web development")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>Programming Languages
                  </dt>
                  <dd>
                    <dl>
                      <dt>Swift
                      </dt>
                      <dd>iOS and macOS development
                      </dd>
                      <dt>JavaScript
                      </dt>
                      <dd>Web development
                      </dd>
                    </dl>
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description list within HTMLDocument renders correctly")
        func descriptionListWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    DescriptionList {
                        DescriptionTerm {
                            HTMLText("HTML")
                        }
                        DescriptionDetails {
                            HTMLText("The standard markup language for creating web pages")
                        }
                        DescriptionTerm {
                            HTMLText("CSS")
                        }
                        DescriptionDetails {
                            HTMLText("A stylesheet language for describing presentation")
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
                <dl>
                  <dt>HTML
                  </dt>
                  <dd>The standard markup language for creating web pages
                  </dd>
                  <dt>CSS
                  </dt>
                  <dd>A stylesheet language for describing presentation
                  </dd>
                </dl>
                  </body>
                </html>
                """
            }
        }
    }
}
