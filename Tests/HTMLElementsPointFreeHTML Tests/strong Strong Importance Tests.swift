import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("StrongImportance Element Tests")
    struct StrongImportanceTests {
        @Test("Basic strong renders correctly")
        func basicStrongRendersCorrectly() {
            assertInlineSnapshot(
                of: StrongImportance {
                    HTMLText("Important")
                },
                as: .html
            ) {
                """
                <strong>Important</strong>
                """
            }
        }

        @Test("Strong within text renders correctly")
        func strongWithinTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("This is ")
                    StrongImportance {
                        HTMLText("very important")
                    }
                    HTMLText(" information.")
                },
                as: .html
            ) {
                """

                <p>This is <strong>very important</strong> information.
                </p>
                """
            }
        }

        @Test("Nested strong and emphasis renders correctly")
        func nestedStrongAndEmphasisRendersCorrectly() {
            assertInlineSnapshot(
                of: StrongImportance {
                    HTMLText("Strong ")
                    Emphasis {
                        HTMLText("and emphasized")
                    }
                    HTMLText(" text")
                },
                as: .html
            ) {
                """
                <strong>Strong <em>and emphasized</em> text</strong>
                """
            }
        }

        @Test("Multiple strong elements render correctly")
        func multipleStrongElementsRenderCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    StrongImportance {
                        HTMLText("Warning:")
                    }
                    HTMLText(" This action will ")
                    StrongImportance {
                        HTMLText("permanently delete")
                    }
                    HTMLText(" your data.")
                },
                as: .html
            ) {
                """

                <p><strong>Warning:</strong> This action will <strong>permanently delete</strong> your data.
                </p>
                """
            }
        }

        @Test("StrongImportance within HTMLDocument renders correctly")
        func strongImportanceWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        H2 {
                            HTMLText("Safety ")
                            StrongImportance {
                                HTMLText("Guidelines")
                            }
                        }
                        Paragraph {
                            StrongImportance {
                                HTMLText("Always")
                            }
                            HTMLText(" wear protective equipment.")
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
                <div>
                  <h2>Safety <strong>Guidelines</strong>
                  </h2>
                  <p><strong>Always</strong> wear protective equipment.
                  </p>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
