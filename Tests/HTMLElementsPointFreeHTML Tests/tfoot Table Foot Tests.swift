import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct TableFootTests {
        @Test("Basic tfoot renders correctly")
        func basicTfootRendersCorrectly() {
            assertInlineSnapshot(
                of: TableFoot {
                    TableRow {
                        TableHeader(scope: "row") {
                            HTMLText("Total")
                        }
                        TableDataCell {
                            HTMLText("$250,000")
                        }
                        TableDataCell {
                            HTMLText("$275,000")
                        }
                        TableDataCell {
                            HTMLText("$300,000")
                        }
                    }
                },
                as: .html
            ) {
                """

                <tfoot>
                  <tr>
                    <th scope="row">Total
                    </th>
                    <td>$250,000
                    </td>
                    <td>$275,000
                    </td>
                    <td>$300,000
                    </td>
                  </tr>
                </tfoot>
                """
            }
        }

        @Test("Tfoot with multiple summary rows renders correctly")
        func tfootWithMultipleSummaryRowsRendersCorrectly() {
            assertInlineSnapshot(
                of: TableFoot {
                    TableRow {
                        TableHeader(scope: "row") {
                            HTMLText("Subtotal")
                        }
                        TableDataCell {
                            HTMLText("$925,000")
                        }
                        TableDataCell {
                            HTMLText("$850,000")
                        }
                        TableDataCell {
                            HTMLText("$1,100,000")
                        }
                    }
                    TableRow {
                        TableHeader(scope: "row") {
                            HTMLText("Tax (10%)")
                        }
                        TableDataCell {
                            HTMLText("$92,500")
                        }
                        TableDataCell {
                            HTMLText("$85,000")
                        }
                        TableDataCell {
                            HTMLText("$110,000")
                        }
                    }
                    TableRow {
                        TableHeader(scope: "row") {
                            StrongImportance {
                                HTMLText("Grand Total")
                            }
                        }
                        TableDataCell {
                            StrongImportance {
                                HTMLText("$1,017,500")
                            }
                        }
                        TableDataCell {
                            StrongImportance {
                                HTMLText("$935,000")
                            }
                        }
                        TableDataCell {
                            StrongImportance {
                                HTMLText("$1,210,000")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <tfoot>
                  <tr>
                    <th scope="row">Subtotal
                    </th>
                    <td>$925,000
                    </td>
                    <td>$850,000
                    </td>
                    <td>$1,100,000
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Tax (10%)
                    </th>
                    <td>$92,500
                    </td>
                    <td>$85,000
                    </td>
                    <td>$110,000
                    </td>
                  </tr>
                  <tr>
                    <th scope="row"><strong>Grand Total</strong>
                    </th>
                    <td><strong>$1,017,500</strong>
                    </td>
                    <td><strong>$935,000</strong>
                    </td>
                    <td><strong>$1,210,000</strong>
                    </td>
                  </tr>
                </tfoot>
                """
            }
        }

        @Test("Tfoot with styling classes renders correctly")
        func tfootWithStylingClassesRendersCorrectly() {
            assertInlineSnapshot(
                of: TableFoot {
                    TableRow {
                        TableHeader(scope: "row") {
                            HTMLText("Average")
                        }
                        TableDataCell {
                            HTMLText("$75,250")
                        }
                        TableDataCell {
                            HTMLText("$68,750")
                        }
                        TableDataCell {
                            HTMLText("$82,500")
                        }
                    }
                    TableRow {
                        TableHeader(scope: "row") {
                            StrongImportance {
                                HTMLText("Total")
                            }
                        }
                        TableDataCell {
                            StrongImportance {
                                HTMLText("$301,000")
                            }
                        }
                        TableDataCell {
                            StrongImportance {
                                HTMLText("$275,000")
                            }
                        }
                        TableDataCell {
                            StrongImportance {
                                HTMLText("$330,000")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <tfoot>
                  <tr>
                    <th scope="row">Average
                    </th>
                    <td>$75,250
                    </td>
                    <td>$68,750
                    </td>
                    <td>$82,500
                    </td>
                  </tr>
                  <tr>
                    <th scope="row"><strong>Total</strong>
                    </th>
                    <td><strong>$301,000</strong>
                    </td>
                    <td><strong>$275,000</strong>
                    </td>
                    <td><strong>$330,000</strong>
                    </td>
                  </tr>
                </tfoot>
                """
            }
        }

        @Test("Tfoot with complex content renders correctly")
        func tfootWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: TableFoot {
                    TableRow {
                        TableDataCell(colspan: 3) {
                            StrongImportance {
                                HTMLText("Summary Statistics:")
                            }
                            HTMLText(" Total revenue increased by ")
                            ContentSpan {
                                HTMLText("15.2%")
                            }
                            HTMLText(" compared to last quarter.")
                        }
                        TableDataCell {
                            Button {
                                HTMLText("Export Data")
                            }
                        }
                    }
                    TableRow {
                        TableDataCell(colspan: 4) {
                            Small {
                                HTMLText(
                                    "* All figures are in USD and include applicable taxes and fees."
                                )
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <tfoot>
                  <tr>
                    <td colspan="3"><strong>Summary Statistics:</strong> Total revenue increased by <span>15.2%</span> compared to last quarter.
                    </td>
                    <td><button>Export Data</button>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="4"><small>* All figures are in USD and include applicable taxes and fees.</small>
                    </td>
                  </tr>
                </tfoot>
                """
            }
        }

        @Test("Tfoot within complete table renders correctly")
        func tfootWithinCompleteTableRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    Caption {
                        HTMLText("Quarterly Financial Summary")
                    }
                    TableHead {
                        TableRow {
                            TableHeader(scope: "col") {
                                HTMLText("Category")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Q1 2024")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Q2 2024")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Q3 2024")
                            }
                        }
                    }
                    TableBody {
                        TableRow {
                            TableHeader(scope: "row") {
                                HTMLText("Revenue")
                            }
                            TableDataCell {
                                HTMLText("$125,000")
                            }
                            TableDataCell {
                                HTMLText("$140,000")
                            }
                            TableDataCell {
                                HTMLText("$155,000")
                            }
                        }
                        TableRow {
                            TableHeader(scope: "row") {
                                HTMLText("Expenses")
                            }
                            TableDataCell {
                                HTMLText("$85,000")
                            }
                            TableDataCell {
                                HTMLText("$92,000")
                            }
                            TableDataCell {
                                HTMLText("$98,000")
                            }
                        }
                        TableRow {
                            TableHeader(scope: "row") {
                                HTMLText("Profit")
                            }
                            TableDataCell {
                                HTMLText("$40,000")
                            }
                            TableDataCell {
                                HTMLText("$48,000")
                            }
                            TableDataCell {
                                HTMLText("$57,000")
                            }
                        }
                    }
                    TableFoot {
                        TableRow {
                            TableHeader(scope: "row") {
                                StrongImportance {
                                    HTMLText("YTD Total")
                                }
                            }
                            TableDataCell {
                                StrongImportance {
                                    HTMLText("$420,000")
                                }
                            }
                            TableDataCell {
                                StrongImportance {
                                    HTMLText("$275,000")
                                }
                            }
                            TableDataCell {
                                StrongImportance {
                                    HTMLText("$145,000")
                                }
                            }
                        }
                        TableRow {
                            TableDataCell(colspan: 4) {
                                Small {
                                    HTMLText(
                                        "Notes: Figures exclude one-time bonuses and extraordinary expenses."
                                    )
                                }
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <caption>Quarterly Financial Summary
                  </caption>
                  <thead>
                    <tr>
                      <th scope="col">Category
                      </th>
                      <th scope="col">Q1 2024
                      </th>
                      <th scope="col">Q2 2024
                      </th>
                      <th scope="col">Q3 2024
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">Revenue
                      </th>
                      <td>$125,000
                      </td>
                      <td>$140,000
                      </td>
                      <td>$155,000
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">Expenses
                      </th>
                      <td>$85,000
                      </td>
                      <td>$92,000
                      </td>
                      <td>$98,000
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">Profit
                      </th>
                      <td>$40,000
                      </td>
                      <td>$48,000
                      </td>
                      <td>$57,000
                      </td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr>
                      <th scope="row"><strong>YTD Total</strong>
                      </th>
                      <td><strong>$420,000</strong>
                      </td>
                      <td><strong>$275,000</strong>
                      </td>
                      <td><strong>$145,000</strong>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4"><small>Notes: Figures exclude one-time bonuses and extraordinary expenses.</small>
                      </td>
                    </tr>
                  </tfoot>
                </table>
                """
            }
        }

        @Test("TableFoot within HTMLDocument renders correctly")
        func tableFootWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Annual Budget Report")
                        }
                        Paragraph {
                            HTMLText(
                                "The following table summarizes our departmental budget allocation and spending for the current fiscal year:"
                            )
                        }
                        Table {
                            Caption {
                                StrongImportance {
                                    HTMLText("FY 2024 Budget Summary")
                                }
                                //                            BR()
                                Small {
                                    HTMLText("All amounts in thousands of dollars")
                                }
                            }
                            TableHead {
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Department")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Allocated Budget")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Amount Spent")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Remaining")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Utilization %")
                                    }
                                }
                            }
                            TableBody {
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Engineering")
                                    }
                                    TableDataCell {
                                        HTMLText("$850")
                                    }
                                    TableDataCell {
                                        HTMLText("$785")
                                    }
                                    TableDataCell {
                                        HTMLText("$65")
                                    }
                                    TableDataCell {
                                        HTMLText("92.4%")
                                    }
                                }
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Marketing")
                                    }
                                    TableDataCell {
                                        HTMLText("$420")
                                    }
                                    TableDataCell {
                                        HTMLText("$445")
                                    }
                                    TableDataCell {
                                        HTMLText("-$25")
                                    }
                                    TableDataCell {
                                        HTMLText("106.0%")
                                    }
                                }
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Operations")
                                    }
                                    TableDataCell {
                                        HTMLText("$320")
                                    }
                                    TableDataCell {
                                        HTMLText("$298")
                                    }
                                    TableDataCell {
                                        HTMLText("$22")
                                    }
                                    TableDataCell {
                                        HTMLText("93.1%")
                                    }
                                }
                            }
                            TableFoot {
                                TableRow {
                                    TableHeader(scope: "row") {
                                        StrongImportance {
                                            HTMLText("Total Budget")
                                        }
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("$1,590")
                                        }
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("$1,528")
                                        }
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("$62")
                                        }
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("96.1%")
                                        }
                                    }
                                }
                                TableRow {
                                    TableDataCell(colspan: "2") {
                                        StrongImportance {
                                            HTMLText("Budget Variance Analysis:")
                                        }
                                    }
                                    TableDataCell(colspan: "2") {
                                        HTMLText("Under budget by $62K (3.9%)")
                                    }
                                    TableDataCell {
                                        ContentSpan {
                                            HTMLText("✓")
                                        }
                                        HTMLText(" On Track")
                                    }
                                }
                                TableRow {
                                    TableDataCell(colspan: "5") {
                                        Small {
                                            StrongImportance {
                                                HTMLText("Notes:")
                                            }
                                            HTMLText(
                                                " Budget figures include projected Q4 spending. Marketing overage approved by executive committee. "
                                            )
                                            Anchor(href: "/budget/details") {
                                                HTMLText("View detailed breakdown")
                                            }
                                            HTMLText(".")
                                        }
                                    }
                                }
                            }
                        }
                        Paragraph {
                            HTMLText(
                                "Overall, we maintain strong fiscal discipline with 96.1% budget utilization across all departments."
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
                  <h2>Annual Budget Report
                  </h2>
                  <p>The following table summarizes our departmental budget allocation and spending for the current fiscal year:
                  </p>
                  <table>
                    <caption><strong>FY 2024 Budget Summary</strong><small>All amounts in thousands of dollars</small>
                    </caption>
                    <thead>
                      <tr>
                        <th scope="col">Department
                        </th>
                        <th scope="col">Allocated Budget
                        </th>
                        <th scope="col">Amount Spent
                        </th>
                        <th scope="col">Remaining
                        </th>
                        <th scope="col">Utilization %
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">Engineering
                        </th>
                        <td>$850
                        </td>
                        <td>$785
                        </td>
                        <td>$65
                        </td>
                        <td>92.4%
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">Marketing
                        </th>
                        <td>$420
                        </td>
                        <td>$445
                        </td>
                        <td>-$25
                        </td>
                        <td>106.0%
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">Operations
                        </th>
                        <td>$320
                        </td>
                        <td>$298
                        </td>
                        <td>$22
                        </td>
                        <td>93.1%
                        </td>
                      </tr>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th scope="row"><strong>Total Budget</strong>
                        </th>
                        <td><strong>$1,590</strong>
                        </td>
                        <td><strong>$1,528</strong>
                        </td>
                        <td><strong>$62</strong>
                        </td>
                        <td><strong>96.1%</strong>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2"><strong>Budget Variance Analysis:</strong>
                        </td>
                        <td colspan="2">Under budget by $62K (3.9%)
                        </td>
                        <td><span>✓</span> On Track
                        </td>
                      </tr>
                      <tr>
                        <td colspan="5"><small><strong>Notes:</strong> Budget figures include projected Q4 spending. Marketing overage approved by executive committee. <a href="/budget/details">View detailed breakdown</a>.</small>
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                  <p>Overall, we maintain strong fiscal discipline with 96.1% budget utilization across all departments.
                  </p>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
