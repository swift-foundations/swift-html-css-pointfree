import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Description Term Element Tests")
    struct DescriptionTermTests {
        @Test("Basic description term renders correctly")
        func basicDescriptionTermRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionTerm {
                    HTMLText("API")
                },
                as: .html
            ) {
                """

                <dt>API
                </dt>
                """
            }
        }

        @Test("Description term within description list renders correctly")
        func descriptionTermWithinDescriptionListRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("HTML")
                    }
                    DescriptionDetails {
                        HTMLText("HyperText Markup Language")
                    }
                    DescriptionTerm {
                        HTMLText("CSS")
                    }
                    DescriptionDetails {
                        HTMLText("Cascading Style Sheets")
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
                  <dt>CSS
                  </dt>
                  <dd>Cascading Style Sheets
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description term with emphasis renders correctly")
        func descriptionTermWithEmphasisRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionTerm {
                    StrongImportance {
                        HTMLText("JavaScript")
                    }
                },
                as: .html
            ) {
                """

                <dt><strong>JavaScript</strong>
                </dt>
                """
            }
        }

        @Test("Description term with code renders correctly")
        func descriptionTermWithCodeRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        Code {
                            HTMLText("Array.map()")
                        }
                    }
                    DescriptionDetails {
                        HTMLText(
                            "Creates a new array with the results of calling a function for every array element."
                        )
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt><code>Array.map()</code>
                  </dt>
                  <dd>Creates a new array with the results of calling a function for every array element.
                  </dd>
                </dl>
                """
            }
        }

        @Test("Multiple description terms for single definition renders correctly")
        func multipleDescriptionTermsForSingleDefinitionRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("Frontend")
                    }
                    DescriptionTerm {
                        HTMLText("Client-side")
                    }
                    DescriptionTerm {
                        HTMLText("UI/UX")
                    }
                    DescriptionDetails {
                        HTMLText("The part of a web application that users interact with directly.")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>Frontend
                  </dt>
                  <dt>Client-side
                  </dt>
                  <dt>UI/UX
                  </dt>
                  <dd>The part of a web application that users interact with directly.
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description term with link renders correctly")
        func descriptionTermWithLinkRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        Anchor(href: "https://reactjs.org") {
                            HTMLText("React")
                        }
                    }
                    DescriptionDetails {
                        HTMLText("A JavaScript library for building user interfaces.")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt><a href="https://reactjs.org">React</a>
                  </dt>
                  <dd>A JavaScript library for building user interfaces.
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description term with mixed content renders correctly")
        func descriptionTermWithMixedContentRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("API (")
                        Emphasis {
                            HTMLText("Application Programming Interface")
                        }
                        HTMLText(")")
                    }
                    DescriptionDetails {
                        HTMLText("A set of protocols and tools for building software applications.")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>API (<em>Application Programming Interface</em>)
                  </dt>
                  <dd>A set of protocols and tools for building software applications.
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description term within HTMLDocument renders correctly")
        func descriptionTermWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    DescriptionList {
                        DescriptionTerm {
                            HTMLText("Swift")
                        }
                        DescriptionDetails {
                            HTMLText("A powerful programming language developed by Apple.")
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
                  <dt>Swift
                  </dt>
                  <dd>A powerful programming language developed by Apple.
                  </dd>
                </dl>
                  </body>
                </html>
                """
            }
        }
    }
}
