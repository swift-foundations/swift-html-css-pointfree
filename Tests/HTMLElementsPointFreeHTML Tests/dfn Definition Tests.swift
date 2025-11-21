import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Definition Element Tests")
    struct DefinitionTests {
        @Test("Basic dfn renders correctly")
        func basicDfnRendersCorrectly() {
            assertInlineSnapshot(
                of: Definition {
                    HTMLText("HTML")
                },
                as: .html
            ) {
                """
                <dfn>HTML</dfn>
                """
            }
        }

        @Test("Dfn with title renders correctly")
        func dfnWithTitleRendersCorrectly() {
            assertInlineSnapshot(
                of: Definition(
                    title: "HyperText Markup Language"
                ) {
                    HTMLText("HTML")
                },
                as: .html
            ) {
                """
                <dfn title="HyperText Markup Language">HTML</dfn>
                """
            }
        }

        @Test("Dfn with complex definition renders correctly")
        func dfnWithComplexDefinitionRendersCorrectly() {
            assertInlineSnapshot(
                of: Definition(
                    title:
                        "Application Programming Interface - a set of protocols and tools for building software applications"
                ) {
                    Abbreviation {
                        HTMLText("API")
                    }
                },
                as: .html
            ) {
                """
                <dfn title="Application Programming Interface - a set of protocols and tools for building software applications"><abbr>API</abbr></dfn>
                """
            }
        }

        @Test("Dfn in technical documentation renders correctly")
        func dfnInTechnicalDocumentationRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The ")
                    Definition(
                        title: "Document Object Model - a programming interface for HTML documents"
                    ) {
                        HTMLText("DOM")
                    }
                    HTMLText(
                        " allows scripts to dynamically access and update the content, structure, and style of documents."
                    )
                },
                as: .html
            ) {
                """

                <p>The <dfn title="Document Object Model - a programming interface for HTML documents">DOM</dfn> allows scripts to dynamically access and update the content, structure, and style of documents.
                </p>
                """
            }
        }

        @Test("Dfn with ID for cross-referencing renders correctly")
        func dfnWithIdForCrossReferencingRendersCorrectly() {
            assertInlineSnapshot(
                of: Definition(
                    title:
                        "Cascading Style Sheets - a style sheet language used for describing the presentation of a document"
                ) {
                    HTMLText("CSS")
                },
                as: .html
            ) {
                """
                <dfn title="Cascading Style Sheets - a style sheet language used for describing the presentation of a document">CSS</dfn>
                """
            }
        }

        @Test("Definition within HTMLDocument renders correctly")
        func definitionWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Web Development Glossary")
                        }
                        DescriptionList {
                            DescriptionTerm {
                                Definition(
                                    title:
                                        "JavaScript - a high-level, interpreted programming language"
                                ) {
                                    HTMLText("JavaScript")
                                }
                            }
                            DescriptionDetails {
                                HTMLText(
                                    "A versatile programming language primarily used to create interactive effects within web browsers."
                                )
                            }
                            DescriptionTerm {
                                Definition(
                                    title:
                                        "Responsive Web Design - an approach that makes web pages render well on various devices"
                                ) {
                                    Abbreviation {
                                        HTMLText("RWD")
                                    }
                                }
                            }
                            DescriptionDetails {
                                HTMLText(
                                    "A design approach aimed at crafting sites to provide optimal viewing experience across different devices."
                                )
                            }
                        }
                        Paragraph {
                            HTMLText("Understanding ")
                            Definition(
                                title:
                                    "Semantic HTML - HTML markup that reinforces the semantics or meaning of the information"
                            ) {
                                HTMLText("semantic HTML")
                            }
                            HTMLText(
                                " is crucial for creating accessible and SEO-friendly web pages."
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
                <article>
                  <h2>Web Development Glossary
                  </h2>
                  <dl>
                    <dt><dfn title="JavaScript - a high-level, interpreted programming language">JavaScript</dfn>
                    </dt>
                    <dd>A versatile programming language primarily used to create interactive effects within web browsers.
                    </dd>
                    <dt><dfn title="Responsive Web Design - an approach that makes web pages render well on various devices"><abbr>RWD</abbr></dfn>
                    </dt>
                    <dd>A design approach aimed at crafting sites to provide optimal viewing experience across different devices.
                    </dd>
                  </dl>
                  <p>Understanding <dfn title="Semantic HTML - HTML markup that reinforces the semantics or meaning of the information">semantic HTML</dfn> is crucial for creating accessible and SEO-friendly web pages.
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
