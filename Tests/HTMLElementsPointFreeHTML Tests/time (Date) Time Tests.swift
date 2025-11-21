import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct TimeTests {
        @Test("Basic time renders correctly")
        func basicTimeRendersCorrectly() {
            assertInlineSnapshot(
                of: Time {
                    HTMLText("March 15, 2024")
                },
                as: .html
            ) {
                """
                <time>March 15, 2024</time>
                """
            }
        }

        @Test("Time with datetime attribute renders correctly")
        func timeWithDatetimeAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Time(
                    datetime: .init("2024-03-15")
                ) {
                    HTMLText("March 15, 2024")
                },
                as: .html
            ) {
                """
                <time datetime="2024-03-15">March 15, 2024</time>
                """
            }
        }

        @Test("Time with full datetime renders correctly")
        func timeWithFullDatetimeRendersCorrectly() {
            assertInlineSnapshot(
                of: Time(
                    datetime: .init("2024-03-15T14:30:00Z")
                ) {
                    HTMLText("March 15, 2024 at 2:30 PM UTC")
                },
                as: .html
            ) {
                """
                <time datetime="2024-03-15T14:30:00Z">March 15, 2024 at 2:30 PM UTC</time>
                """
            }
        }

        @Test("Time within paragraph renders correctly")
        func timeWithinParagraphRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("The event was held on ")
                    Time(
                        datetime: .init("2024-12-25")
                    ) {
                        HTMLText("Christmas Day")
                    }
                    HTMLText(" last year.")
                },
                as: .html
            ) {
                """

                <p>The event was held on <time datetime="2024-12-25">Christmas Day</time> last year.
                </p>
                """
            }
        }

        @Test("Time with relative datetime renders correctly")
        func timeWithRelativeDatetimeRendersCorrectly() {
            assertInlineSnapshot(
                of: Time(
                    datetime: .init("PT2H30M")
                ) {
                    HTMLText("2 hours and 30 minutes")
                },
                as: .html
            ) {
                """
                <time datetime="PT2H30M">2 hours and 30 minutes</time>
                """
            }
        }

        @Test("Time in article context renders correctly")
        func timeInArticleContextRendersCorrectly() {
            assertInlineSnapshot(
                of: Article {
                    Header {
                        HTMLElement(tag: "h1") {
                            HTMLText("Breaking News")
                        }
                        Paragraph {
                            HTMLText("Published on ")
                            Time(
                                datetime: .init("2024-03-15T09:00:00-05:00")
                            ) {
                                HTMLText("March 15, 2024")
                            }
                        }
                    }
                    Paragraph {
                        HTMLText("This is the article content.")
                    }
                },
                as: .html
            ) {
                """

                <article>
                  <header>
                    <h1>Breaking News
                    </h1>
                    <p>Published on <time datetime="2024-03-15T09:00:00-05:00">March 15, 2024</time>
                    </p>
                  </header>
                  <p>This is the article content.
                  </p>
                </article>
                """
            }
        }

        @Test("Time within HTMLDocument renders correctly")
        func timeWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        HTMLText("Last updated: ")
                        Time(
                            datetime: .init("2024-03-15T16:45:00")
                        ) {
                            HTMLText("March 15, 2024 at 4:45 PM")
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
                <div>Last updated: <time datetime="2024-03-15T16:45:00">March 15, 2024 at 4:45 PM</time>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
