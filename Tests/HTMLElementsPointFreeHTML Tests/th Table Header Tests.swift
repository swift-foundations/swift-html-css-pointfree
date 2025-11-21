import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct TableHeaderTests {
        @Test("Basic th renders correctly")
        func basicThRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHeader {
                    HTMLText("Header Cell")
                },
                as: .html
            ) {
                """

                <th>Header Cell
                </th>
                """
            }
        }

        @Test("Th with scope column renders correctly")
        func thWithScopeColumnRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHeader(
                    scope: "col"
                ) {
                    HTMLText("Product Name")
                },
                as: .html
            ) {
                """

                <th scope="col">Product Name
                </th>
                """
            }
        }

        @Test("Th with scope row renders correctly")
        func thWithScopeRowRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHeader(
                    scope: "row"
                ) {
                    HTMLText("Total Sales")
                },
                as: .html
            ) {
                """

                <th scope="row">Total Sales
                </th>
                """
            }
        }

        @Test("Th with colspan renders correctly")
        func thWithColspanRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHeader(
                    colspan: 3,
                    scope: "col"
                ) {
                    HTMLText("Quarterly Results")
                },
                as: .html
            ) {
                """

                <th scope="col" colspan="3">Quarterly Results
                </th>
                """
            }
        }

        @Test("Th with abbr attribute renders correctly")
        func thWithAbbrAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHeader(
                    abbr: "Company Name",
                    scope: "col"
                ) {
                    HTMLText("Company")
                },
                as: .html
            ) {
                """

                <th scope="col" abbr="Company Name">Company
                </th>
                """
            }
        }

        @Test("Th with all attributes renders correctly")
        func thWithAllAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHeader(
                    abbr: "Financial Quarter Results",
                    colspan: 2,
                    headers: "main-header",
                    rowspan: 1,
                    scope: "col"
                ) {
                    HTMLText("Q1-Q2 Results")
                },
                as: .html
            ) {
                """

                <th scope="col" rowspan="1" headers="main-header" colspan="2" abbr="Financial Quarter Results">Q1-Q2 Results
                </th>
                """
            }
        }

        @Test("TableHeader within HTMLDocument renders correctly")
        func tableHeaderWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Table {
                            Caption {
                                HTMLText("Annual Sales Report 2024")
                            }
                            TableHead {
                                TableRow {
                                    TableHeader(
                                        scope: "col"
                                    ) {
                                        HTMLText("Region")
                                    }
                                    TableHeader(
                                        abbr: "Q1",
                                        scope: "col"
                                    ) {
                                        HTMLText("First Quarter")
                                    }
                                    TableHeader(
                                        abbr: "Q2",
                                        scope: "col"
                                    ) {
                                        HTMLText("Second Quarter")
                                    }
                                    TableHeader(
                                        abbr: "Q3",
                                        scope: "col"
                                    ) {
                                        HTMLText("Third Quarter")
                                    }
                                    TableHeader(
                                        abbr: "Q4",
                                        scope: "col"
                                    ) {
                                        HTMLText("Fourth Quarter")
                                    }
                                    TableHeader(
                                        scope: "col"
                                    ) {
                                        HTMLText("Total")
                                    }
                                }
                            }
                            TableBody {
                                TableRow {
                                    TableHeader(
                                        scope: "row"
                                    ) {
                                        HTMLText("North America")
                                    }
                                    TableDataCell {
                                        HTMLText("$125,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$140,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$135,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$150,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$550,000")
                                    }
                                }
                                TableRow {
                                    TableHeader(
                                        scope: "row"
                                    ) {
                                        HTMLText("Europe")
                                    }
                                    TableDataCell {
                                        HTMLText("$95,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$110,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$105,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$120,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$430,000")
                                    }
                                }
                            }
                            TableFoot {
                                TableRow {
                                    TableHeader(
                                        scope: "row"
                                    ) {
                                        HTMLText("Grand Total")
                                    }
                                    TableDataCell {
                                        HTMLText("$220,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$250,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$240,000")
                                    }
                                    TableDataCell {
                                        HTMLText("$270,000")
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("$980,000")
                                        }
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
                    <caption>Annual Sales Report 2024
                    </caption>
                    <thead>
                      <tr>
                        <th scope="col">Region
                        </th>
                        <th scope="col" abbr="Q1">First Quarter
                        </th>
                        <th scope="col" abbr="Q2">Second Quarter
                        </th>
                        <th scope="col" abbr="Q3">Third Quarter
                        </th>
                        <th scope="col" abbr="Q4">Fourth Quarter
                        </th>
                        <th scope="col">Total
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">North America
                        </th>
                        <td>$125,000
                        </td>
                        <td>$140,000
                        </td>
                        <td>$135,000
                        </td>
                        <td>$150,000
                        </td>
                        <td>$550,000
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">Europe
                        </th>
                        <td>$95,000
                        </td>
                        <td>$110,000
                        </td>
                        <td>$105,000
                        </td>
                        <td>$120,000
                        </td>
                        <td>$430,000
                        </td>
                      </tr>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th scope="row">Grand Total
                        </th>
                        <td>$220,000
                        </td>
                        <td>$250,000
                        </td>
                        <td>$240,000
                        </td>
                        <td>$270,000
                        </td>
                        <td><strong>$980,000</strong>
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
