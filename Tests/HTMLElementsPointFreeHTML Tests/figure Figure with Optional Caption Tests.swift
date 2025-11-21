import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Figure with Optional Caption Element Tests")
    struct FigureCaptionTests {
        @Test("Basic figure with image renders correctly")
        func basicFigureWithImageRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    Image(
                        src: "chart.png",
                        alt: "Sales Chart"
                    )()
                },
                as: .html
            ) {
                """

                <figcaption><img alt="Sales Chart" src="chart.png">
                </figcaption>
                """
            }
        }

        @Test("Figure with image and caption renders correctly")
        func figureWithImageAndCaptionRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    Image(
                        src: "sunset.jpg",
                        alt: "Beautiful sunset over mountains"
                    )()
                    FigureCaption {
                        HTMLText("A breathtaking sunset captured during our mountain hike.")
                    }
                },
                as: .html
            ) {
                """

                <figcaption><img alt="Beautiful sunset over mountains" src="sunset.jpg">
                  <figcaption>A breathtaking sunset captured during our mountain hike.
                  </figcaption>
                </figcaption>
                """
            }
        }

        @Test("Figure with code block renders correctly")
        func figureWithCodeBlockRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    PreformattedText {
                        Code {
                            HTMLText(
                                """
                                function fibonacci(n) {
                                  if (n <= 1) return n;
                                  return fibonacci(n - 1) + fibonacci(n - 2);
                                }
                                """
                            )
                        }
                    }
                    FigureCaption {
                        HTMLText("Example 1: A recursive Fibonacci implementation")
                    }
                },
                as: .html
            ) {
                """

                <figcaption>
                  <pre><code>function fibonacci(n) {
                  if (n &lt;= 1) return n;
                  return fibonacci(n - 1) + fibonacci(n - 2);
                }</code></pre>
                  <figcaption>Example 1: A recursive Fibonacci implementation
                  </figcaption>
                </figcaption>
                """
            }
        }

        @Test("Figure with video renders correctly")
        func figureWithVideoRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    Video(
                        src: "demo.mp4",
                        controls: true,
                        width: 640,
                        height: 360
                    ) {
                        HTMLText("Your browser does not support video.")
                    }
                    FigureCaption {
                        HTMLText("Product demonstration video showing key features")
                    }
                },
                as: .html
            ) {
                """

                <figcaption>
                  <video height="360" width="640" controls src="demo.mp4">Your browser does not support video.
                  </video>
                  <figcaption>Product demonstration video showing key features
                  </figcaption>
                </figcaption>
                """
            }
        }

        @Test("Figure with table renders correctly")
        func figureWithTableRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    Table {
                        TableHead {
                            TableRow {
                                TableHeader {
                                    HTMLText("Product")
                                }
                                TableHeader {
                                    HTMLText("Price")
                                }
                            }
                        }
                        TableBody {
                            TableRow {
                                TableDataCell {
                                    HTMLText("Widget A")
                                }
                                TableDataCell {
                                    HTMLText("$19.99")
                                }
                            }
                        }
                    }
                    FigureCaption {
                        HTMLText("Table 1: Product pricing comparison")
                    }
                },
                as: .html
            ) {
                """

                <figcaption>
                  <table>
                    <thead>
                      <tr>
                        <th>Product
                        </th>
                        <th>Price
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Widget A
                        </td>
                        <td>$19.99
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <figcaption>Table 1: Product pricing comparison
                  </figcaption>
                </figcaption>
                """
            }
        }

        @Test("Figure with blockquote renders correctly")
        func figureWithBlockquoteRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    BlockQuote {
                        HTMLText("The only impossible journey is the one you never begin.")
                    }
                    FigureCaption {
                        HTMLText("Tony Robbins, motivational speaker")
                    }
                },
                as: .html
            ) {
                """

                <figcaption>
                  <blockquote>The only impossible journey is the one you never begin.
                  </blockquote>
                  <figcaption>Tony Robbins, motivational speaker
                  </figcaption>
                </figcaption>
                """
            }
        }

        @Test("Figure with multiple elements renders correctly")
        func figureWithMultipleElementsRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    Image(
                        src: "graph1.png",
                        alt: "Q1 Results"
                    )()
                    Image(
                        src: "graph2.png",
                        alt: "Q2 Results"
                    )()
                    FigureCaption {
                        HTMLText("Figure 2: Quarterly results comparison showing steady growth")
                    }
                },
                as: .html
            ) {
                """

                <figcaption><img alt="Q1 Results" src="graph1.png"><img alt="Q2 Results" src="graph2.png">
                  <figcaption>Figure 2: Quarterly results comparison showing steady growth
                  </figcaption>
                </figcaption>
                """
            }
        }

        @Test("Figure without caption renders correctly")
        func figureWithoutCaptionRendersCorrectly() {
            assertInlineSnapshot(
                of: FigureCaption {
                    Image(
                        src: "decorative.jpg",
                        alt: "Decorative image"
                    )()
                },
                as: .html
            ) {
                """

                <figcaption><img alt="Decorative image" src="decorative.jpg">
                </figcaption>
                """
            }
        }
    }
}
