import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Caption Element Tests")
    struct CaptionTests {
        @Test("Basic caption renders correctly")
        func basicCaptionRendersCorrectly() {
            assertInlineSnapshot(
                of: Caption {
                    HTMLText("Employee Information")
                },
                as: .html
            ) {
                """

                <caption>Employee Information
                </caption>
                """
            }
        }

        @Test("Caption with descriptive text renders correctly")
        func captionWithDescriptiveTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Caption {
                    HTMLText("Quarterly Sales Results - All figures in USD")
                },
                as: .html
            ) {
                """

                <caption>Quarterly Sales Results - All figures in USD
                </caption>
                """
            }
        }

        @Test("Caption with complex content renders correctly")
        func captionWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Caption {
                    StrongImportance {
                        HTMLText("Table 1:")
                    }
                    HTMLText(" Population statistics by region for ")
                    Time(datetime: "2024") {
                        HTMLText("2024")
                    }
                },
                as: .html
            ) {
                """

                <caption><strong>Table 1:</strong> Population statistics by region for <time datetime="2024">2024</time>
                </caption>
                """
            }
        }

        @Test("Caption within table renders correctly")
        func captionWithinTableRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    Caption {
                        HTMLText("Product Comparison Chart")
                    }
                    TableRow {
                        TableHeader {
                            HTMLText("Product")
                        }
                        TableHeader {
                            HTMLText("Price")
                        }
                        TableHeader {
                            HTMLText("Rating")
                        }
                    }
                    TableRow {
                        TableDataCell {
                            HTMLText("Laptop A")
                        }
                        TableDataCell {
                            HTMLText("$999")
                        }
                        TableDataCell {
                            HTMLText("4.5/5")
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <caption>Product Comparison Chart
                  </caption>
                  <tr>
                    <th>Product
                    </th>
                    <th>Price
                    </th>
                    <th>Rating
                    </th>
                  </tr>
                  <tr>
                    <td>Laptop A
                    </td>
                    <td>$999
                    </td>
                    <td>4.5/5
                    </td>
                  </tr>
                </table>
                """
            }
        }

        @Test("Caption with styling class renders correctly")
        func captionWithStylingClassRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    Caption {
                        HTMLText("Annual Report Data Summary")
                    }
                    TableHead {
                        TableRow {
                            TableHeader {
                                HTMLText("Department")
                            }
                            TableHeader {
                                HTMLText("Budget")
                            }
                            TableHeader {
                                HTMLText("Spent")
                            }
                        }
                    }
                    TableBody {
                        TableRow {
                            TableDataCell {
                                HTMLText("Engineering")
                            }
                            TableDataCell {
                                HTMLText("$500,000")
                            }
                            TableDataCell {
                                HTMLText("$475,000")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <caption>Annual Report Data Summary
                  </caption>
                  <thead>
                    <tr>
                      <th>Department
                      </th>
                      <th>Budget
                      </th>
                      <th>Spent
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Engineering
                      </td>
                      <td>$500,000
                      </td>
                      <td>$475,000
                      </td>
                    </tr>
                  </tbody>
                </table>
                """
            }
        }

        @Test("Caption within HTMLDocument renders correctly")
        func captionWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Market Analysis Report")
                        }
                        Paragraph {
                            HTMLText(
                                "The following table shows market performance across different sectors:"
                            )
                        }
                        Table {
                            Caption {
                                StrongImportance {
                                    HTMLText("Market Performance by Sector")
                                }
                                //                            BR()
                                Small {
                                    HTMLText("Data as of ")
                                    Time(datetime: "2024-01-15") {
                                        HTMLText("January 15, 2024")
                                    }
                                }
                            }
                            TableHead {
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Sector")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Performance")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Change")
                                    }
                                }
                            }
                            TableBody {
                                TableRow {
                                    TableDataCell {
                                        HTMLText("Technology")
                                    }
                                    TableDataCell {
                                        HTMLText("+15.2%")
                                    }
                                    TableDataCell {
                                        HTMLText("↑")
                                    }
                                }
                                TableRow {
                                    TableDataCell {
                                        HTMLText("Healthcare")
                                    }
                                    TableDataCell {
                                        HTMLText("+8.7%")
                                    }
                                    TableDataCell {
                                        HTMLText("↑")
                                    }
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
                <article>
                  <h2>Market Analysis Report
                  </h2>
                  <p>The following table shows market performance across different sectors:
                  </p>
                  <table>
                    <caption><strong>Market Performance by Sector</strong><small>Data as of <time datetime="2024-01-15">January 15, 2024</time></small>
                    </caption>
                    <thead>
                      <tr>
                        <th scope="col">Sector
                        </th>
                        <th scope="col">Performance
                        </th>
                        <th scope="col">Change
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Technology
                        </td>
                        <td>+15.2%
                        </td>
                        <td>↑
                        </td>
                      </tr>
                      <tr>
                        <td>Healthcare
                        </td>
                        <td>+8.7%
                        </td>
                        <td>↑
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
