import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct UnarticulatedAnnotationTests {
        @Test("Basic u renders correctly")
        func basicURendersCorrectly() {
            assertInlineSnapshot(
                of: UnarticulatedAnnotation {
                    HTMLText("Misspelled word")
                },
                as: .html
            ) {
                """
                <u>Misspelled word</u>
                """
            }
        }

        @Test("U for proper names in Chinese text renders correctly")
        func uForProperNamesInChineseTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("在中国历史上，")
                    UnarticulatedAnnotation {
                        HTMLText("秦始皇")
                    }
                    HTMLText("是第一个皇帝。")
                },
                as: .html
            ) {
                """

                <p>在中国历史上，<u>秦始皇</u>是第一个皇帝。
                </p>
                """
            }
        }

        @Test("U for misspelled words renders correctly")
        func uForMisspelledWordsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Please check the ")
                    UnarticulatedAnnotation {
                        HTMLText("seperate")
                    }
                    HTMLText(" document for more information.")
                },
                as: .html
            ) {
                """

                <p>Please check the <u>seperate</u> document for more information.
                </p>
                """
            }
        }

        @Test("U with nested content renders correctly")
        func uWithNestedContentRendersCorrectly() {
            assertInlineSnapshot(
                of: UnarticulatedAnnotation {
                    StrongImportance {
                        HTMLText("Important")
                    }
                    HTMLText(" but ")
                    Emphasis {
                        HTMLText("unarticulated")
                    }
                    HTMLText(" annotation")
                },
                as: .html
            ) {
                """
                <u><strong>Important</strong> but <em>unarticulated</em> annotation</u>
                """
            }
        }

        @Test("U in multilingual content renders correctly")
        func uInMultilingualContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The city ")
                    UnarticulatedAnnotation {
                        HTMLText("北京")
                    }
                    HTMLText(" (Beijing) is the capital of China.")
                },
                as: .html
            ) {
                """

                <p>The city <u>北京</u> (Beijing) is the capital of China.
                </p>
                """
            }
        }

        @Test("U with ID and data attributes renders correctly")
        func uWithIdAndDataAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: UnarticulatedAnnotation {
                    HTMLText("Highlighted text")
                },
                as: .html
            ) {
                """
                <u>Highlighted text</u>
                """
            }
        }

        @Test("UnarticulatedAnnotation within HTMLDocument renders correctly")
        func unarticulatedAnnotationWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Language Learning Exercise")
                        }
                        Section {
                            H3 {
                                HTMLText("Chinese Proper Names")
                            }
                            Paragraph {
                                HTMLText("Identify the proper names in the following text:")
                            }
                            Paragraph {
                                HTMLText("在古代中国，")
                                UnarticulatedAnnotation {
                                    HTMLText("孔子")
                                }
                                HTMLText("是一位伟大的哲学家。他的思想影响了整个")
                                UnarticulatedAnnotation {
                                    HTMLText("中华文明")
                                }
                                HTMLText("。")
                            }
                        }
                        Section {
                            H3 {
                                HTMLText("Spelling Check")
                            }
                            Paragraph {
                                HTMLText("The following paragraph contains spelling errors:")
                            }
                            Paragraph {
                                HTMLText("The ")
                                UnarticulatedAnnotation {
                                    HTMLText("recieve")
                                }
                                HTMLText(" function should ")
                                UnarticulatedAnnotation {
                                    HTMLText("seperate")
                                }
                                HTMLText(" the data into ")
                                UnarticulatedAnnotation {
                                    HTMLText("differnt")
                                }
                                HTMLText(" categories.")
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
                <article>
                  <h2>Language Learning Exercise
                  </h2>
                  <section>
                    <h3>Chinese Proper Names
                    </h3>
                    <p>Identify the proper names in the following text:
                    </p>
                    <p>在古代中国，<u>孔子</u>是一位伟大的哲学家。他的思想影响了整个<u>中华文明</u>。
                    </p>
                  </section>
                  <section>
                    <h3>Spelling Check
                    </h3>
                    <p>The following paragraph contains spelling errors:
                    </p>
                    <p>The <u>recieve</u> function should <u>seperate</u> the data into <u>differnt</u> categories.
                    </p>
                  </section>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
