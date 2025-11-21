import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Description Details Element Tests")
    struct DescriptionDetailsTests {
        @Test("Basic description details renders correctly")
        func basicDescriptionDetailsRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionDetails {
                    HTMLText("A markup language for creating web pages.")
                },
                as: .html
            ) {
                """

                <dd>A markup language for creating web pages.
                </dd>
                """
            }
        }

        @Test("Description details within description list renders correctly")
        func descriptionDetailsWithinDescriptionListRendersCorrectly() {
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

        @Test("Description details with complex content renders correctly")
        func descriptionDetailsWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionDetails {
                    Paragraph {
                        HTMLText("JavaScript is a ")
                        StrongImportance {
                            HTMLText("dynamic")
                        }
                        HTMLText(" programming language.")
                    }
                    Paragraph {
                        HTMLText("It's commonly used for web development.")
                    }
                },
                as: .html
            ) {
                """

                <dd>
                  <p>JavaScript is a <strong>dynamic</strong> programming language.
                  </p>
                  <p>It's commonly used for web development.
                  </p>
                </dd>
                """
            }
        }

        @Test("Multiple description details for single term renders correctly")
        func multipleDescriptionDetailsForSingleTermRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("Web Browser")
                    }
                    DescriptionDetails {
                        HTMLText("Chrome - Google's web browser")
                    }
                    DescriptionDetails {
                        HTMLText("Firefox - Mozilla's web browser")
                    }
                    DescriptionDetails {
                        HTMLText("Safari - Apple's web browser")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>Web Browser
                  </dt>
                  <dd>Chrome - Google's web browser
                  </dd>
                  <dd>Firefox - Mozilla's web browser
                  </dd>
                  <dd>Safari - Apple's web browser
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description details with links renders correctly")
        func descriptionDetailsWithLinksRendersCorrectly() {
            assertInlineSnapshot(
                of: DescriptionList {
                    DescriptionTerm {
                        HTMLText("Swift")
                    }
                    DescriptionDetails {
                        HTMLText("A programming language developed by Apple. Learn more at ")
                        Anchor(href: "https://swift.org") {
                            HTMLText("swift.org")
                        }
                        HTMLText(".")
                    }
                },
                as: .html
            ) {
                """

                <dl>
                  <dt>Swift
                  </dt>
                  <dd>A programming language developed by Apple. Learn more at <a href="https://swift.org">swift.org</a>.
                  </dd>
                </dl>
                """
            }
        }

        @Test("Description details within HTMLDocument renders correctly")
        func descriptionDetailsWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    DescriptionList {
                        DescriptionTerm {
                            HTMLText("API")
                        }
                        DescriptionDetails {
                            HTMLText(
                                "Application Programming Interface - a set of protocols and tools for building software applications."
                            )
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
                  <dt>API
                  </dt>
                  <dd>Application Programming Interface - a set of protocols and tools for building software applications.
                  </dd>
                </dl>
                  </body>
                </html>
                """
            }
        }
    }
}
