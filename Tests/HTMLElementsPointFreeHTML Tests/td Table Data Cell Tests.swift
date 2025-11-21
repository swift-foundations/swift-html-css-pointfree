import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Table Data Cell Tests")
    struct TableDataCellTests {
        @Test("Basic td renders correctly")
        func basicTdRendersCorrectly() {
            assertInlineSnapshot(
                of: TableDataCell {
                    HTMLText("Cell content")
                },
                as: .html
            ) {
                """

                <td>Cell content
                </td>
                """
            }
        }

        @Test("Td with colspan renders correctly")
        func tdWithColspanRendersCorrectly() {
            assertInlineSnapshot(
                of: TableDataCell(
                    colspan: 2
                ) {
                    HTMLText("Spans two columns")
                },
                as: .html
            ) {
                """

                <td colspan="2">Spans two columns
                </td>
                """
            }
        }

        @Test("Td with rowspan renders correctly")
        func tdWithRowspanRendersCorrectly() {
            assertInlineSnapshot(
                of: TableDataCell(
                    rowspan: 3
                ) {
                    HTMLText("Spans three rows")
                },
                as: .html
            ) {
                """

                <td rowspan="3">Spans three rows
                </td>
                """
            }
        }

        @Test("Td with headers attribute renders correctly")
        func tdWithHeadersAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: TableDataCell(
                    headers: "name-header age-header"
                ) {
                    HTMLText("John, 30")
                },
                as: .html
            ) {
                """

                <td headers="name-header age-header">John, 30
                </td>
                """
            }
        }

        @Test("Td with all attributes renders correctly")
        func tdWithAllAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: TableDataCell(
                    colspan: 2,
                    headers: "quarter-header total-header",
                    rowspan: 2
                ) {
                    HTMLText("$10,000")
                },
                as: .html
            ) {
                """

                <td rowspan="2" headers="quarter-header total-header" colspan="2">$10,000
                </td>
                """
            }
        }

        @Test("Td with complex content renders correctly")
        func tdWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: TableDataCell {
                    StrongImportance {
                        HTMLText("Product Name")
                    }
                    //                BR()
                    ContentSpan {
                        HTMLText("$29.99")
                    }
                    //                BR()
                    Anchor(href: "/product/123") {
                        HTMLText("View Details")
                    }
                },
                as: .html
            ) {
                """

                <td><strong>Product Name</strong><span>$29.99</span><a href="/product/123">View Details</a>
                </td>
                """
            }
        }

        @Test("TableDataCell within HTMLDocument renders correctly")
        func tableDataCellWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Table {
                            Caption {
                                HTMLText("Product Comparison Table")
                            }
                            TableHead {
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Product")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Price")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Rating")
                                    }
                                }
                            }
                            TableBody {
                                TableRow {
                                    TableDataCell(
                                        headers: "product-header"
                                    ) {
                                        HTMLText("Laptop Pro")
                                    }
                                    TableDataCell(
                                        headers: "price-header"
                                    ) {
                                        HTMLText("$1,299")
                                    }
                                    TableDataCell(
                                        headers: "rating-header"
                                    ) {
                                        HTMLText("4.5/5")
                                    }
                                }
                                TableRow {
                                    TableDataCell(
                                        headers: "product-header"
                                    ) {
                                        HTMLText("Tablet Max")
                                    }
                                    TableDataCell(
                                        headers: "price-header"
                                    ) {
                                        HTMLText("$899")
                                    }
                                    TableDataCell(
                                        headers: "rating-header"
                                    ) {
                                        HTMLText("4.2/5")
                                    }
                                }
                                TableRow {
                                    TableDataCell(
                                        colspan: 2,
                                        headers: "product-header price-header"
                                    ) {
                                        StrongImportance {
                                            HTMLText("Average Price")
                                        }
                                    }
                                    TableDataCell(
                                        headers: "rating-header"
                                    ) {
                                        HTMLText("$1,099")
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
                <div>
                  <table>
                    <caption>Product Comparison Table
                    </caption>
                    <thead>
                      <tr>
                        <th scope="col">Product
                        </th>
                        <th scope="col">Price
                        </th>
                        <th scope="col">Rating
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td headers="product-header">Laptop Pro
                        </td>
                        <td headers="price-header">$1,299
                        </td>
                        <td headers="rating-header">4.5/5
                        </td>
                      </tr>
                      <tr>
                        <td headers="product-header">Tablet Max
                        </td>
                        <td headers="price-header">$899
                        </td>
                        <td headers="rating-header">4.2/5
                        </td>
                      </tr>
                      <tr>
                        <td headers="product-header price-header" colspan="2"><strong>Average Price</strong>
                        </td>
                        <td headers="rating-header">$1,099
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
