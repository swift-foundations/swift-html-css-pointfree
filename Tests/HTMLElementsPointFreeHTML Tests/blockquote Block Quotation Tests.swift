import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Block Quotation Element Tests")
    struct BlockQuoteTests {
        @Test("Basic blockquote renders correctly")
        func basicBlockquoteRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    HTMLText("The only way to do great work is to love what you do.")
                },
                as: .html
            ) {
                """

                <blockquote>The only way to do great work is to love what you do.
                </blockquote>
                """
            }
        }

        @Test("Blockquote with cite attribute renders correctly")
        func blockquoteWithCiteAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    HTMLText("Stay hungry, stay foolish.")
                }
                .attribute("cite", "https://news.stanford.edu/2005/06/14/jobs-061505/"),
                as: .html
            ) {
                """

                <blockquote cite="https://news.stanford.edu/2005/06/14/jobs-061505/">Stay hungry, stay foolish.
                </blockquote>
                """
            }
        }

        @Test("Blockquote with nested elements renders correctly")
        func blockquoteWithNestedElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    Paragraph {
                        HTMLText("Innovation distinguishes between a leader and a follower.")
                    }
                    ContentDivision {
                        HTMLText("— Steve Jobs")
                    }
                    .attribute("class", "author")
                },
                as: .html
            ) {
                """

                <blockquote>
                  <p>Innovation distinguishes between a leader and a follower.
                  </p>
                  <div class="author">— Steve Jobs
                  </div>
                </blockquote>
                """
            }
        }

        @Test("Blockquote with footer and cite renders correctly")
        func blockquoteWithFooterAndCiteRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    Paragraph {
                        HTMLText(
                            "The future belongs to those who believe in the beauty of their dreams."
                        )
                    }
                    Footer {
                        HTMLText("— ")
                        Cite {
                            HTMLText("Eleanor Roosevelt")
                        }
                    }
                }
                .attribute("cite", "https://www.goodreads.com/quotes/tag/dreams"),
                as: .html
            ) {
                """

                <blockquote cite="https://www.goodreads.com/quotes/tag/dreams">
                  <p>The future belongs to those who believe in the beauty of their dreams.
                  </p>
                  <footer>— <cite>Eleanor Roosevelt</cite>
                  </footer>
                </blockquote>
                """
            }
        }

        @Test("Multi-paragraph blockquote renders correctly")
        func multiParagraphBlockquoteRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    Paragraph {
                        HTMLText(
                            "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment."
                        )
                    }
                    Paragraph {
                        HTMLText(
                            "Do not go where the path may lead, go instead where there is no path and leave a trail."
                        )
                    }
                },
                as: .html
            ) {
                """

                <blockquote>
                  <p>To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.
                  </p>
                  <p>Do not go where the path may lead, go instead where there is no path and leave a trail.
                  </p>
                </blockquote>
                """
            }
        }

        @Test("Blockquote with custom styling renders correctly")
        func blockquoteWithCustomStylingRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    HTMLText("Be the change you wish to see in the world.")
                }
                .attribute("class", "inspirational-quote")
                .attribute(
                    "style",
                    "font-style: italic; border-left: 4px solid #ccc; padding-left: 20px;"
                ),
                as: .html
            ) {
                """

                <blockquote class="inspirational-quote" style="font-style: italic; border-left: 4px solid #ccc; padding-left: 20px;">Be the change you wish to see in the world.
                </blockquote>
                """
            }
        }

        @Test("Empty blockquote renders correctly")
        func emptyBlockquoteRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <blockquote>
                </blockquote>
                """
            }
        }

        @Test("Nested blockquote renders correctly")
        func nestedBlockquoteRendersCorrectly() {
            assertInlineSnapshot(
                of: BlockQuote {
                    HTMLText("As someone once said:")
                    BlockQuote {
                        HTMLText(
                            "The best time to plant a tree was 20 years ago. The second best time is now."
                        )
                    }
                    HTMLText("This wisdom still holds true today.")
                },
                as: .html
            ) {
                """

                <blockquote>As someone once said:
                  <blockquote>The best time to plant a tree was 20 years ago. The second best time is now.
                  </blockquote>This wisdom still holds true today.
                </blockquote>
                """
            }
        }
    }
}
