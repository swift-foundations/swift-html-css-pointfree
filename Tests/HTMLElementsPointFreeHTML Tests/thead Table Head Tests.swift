import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct TableHeadTests {
        @Test("Basic thead renders correctly")
        func basicTheadRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHead {
                    TableRow {
                        TableHeader {
                            HTMLText("Name")
                        }
                        TableHeader {
                            HTMLText("Age")
                        }
                        TableHeader {
                            HTMLText("City")
                        }
                    }
                },
                as: .html
            ) {
                """

                <thead>
                  <tr>
                    <th>Name
                    </th>
                    <th>Age
                    </th>
                    <th>City
                    </th>
                  </tr>
                </thead>
                """
            }
        }

        @Test("Thead with multiple rows renders correctly")
        func theadWithMultipleRowsRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHead {
                    TableRow {
                        TableHeader(
                            colspan: 2,
                            scope: "colgroup"
                        ) {
                            HTMLText("Personal Information")
                        }
                        TableHeader(
                            colspan: 2,
                            scope: "colgroup"
                        ) {
                            HTMLText("Contact Details")
                        }
                    }
                    TableRow {
                        TableHeader(scope: "col") {
                            HTMLText("First Name")
                        }
                        TableHeader(scope: "col") {
                            HTMLText("Last Name")
                        }
                        TableHeader(scope: "col") {
                            HTMLText("Email")
                        }
                        TableHeader(scope: "col") {
                            HTMLText("Phone")
                        }
                    }
                },
                as: .html
            ) {
                """

                <thead>
                  <tr>
                    <th scope="colgroup" colspan="2">Personal Information
                    </th>
                    <th scope="colgroup" colspan="2">Contact Details
                    </th>
                  </tr>
                  <tr>
                    <th scope="col">First Name
                    </th>
                    <th scope="col">Last Name
                    </th>
                    <th scope="col">Email
                    </th>
                    <th scope="col">Phone
                    </th>
                  </tr>
                </thead>
                """
            }
        }

        @Test("Thead with styling classes renders correctly")
        func theadWithStylingClassesRendersCorrectly() {
            assertInlineSnapshot(
                of: TableHead {
                    TableRow {
                        TableHeader(scope: "col") {
                            HTMLText("Product Name")
                        }
                        TableHeader(scope: "col") {
                            HTMLText("Price")
                        }
                        TableHeader(scope: "col") {
                            HTMLText("Category")
                        }
                        TableHeader(scope: "col") {
                            HTMLText("Actions")
                        }
                    }
                },
                as: .html
            ) {
                """

                <thead>
                  <tr>
                    <th scope="col">Product Name
                    </th>
                    <th scope="col">Price
                    </th>
                    <th scope="col">Category
                    </th>
                    <th scope="col">Actions
                    </th>
                  </tr>
                </thead>
                """
            }
        }

        @Test("Thead within complete table renders correctly")
        func theadWithinCompleteTableRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    Caption {
                        HTMLText("Employee Information")
                    }
                    TableHead {
                        TableRow {
                            TableHeader(scope: "col") {
                                HTMLText("ID")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Name")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Department")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Salary")
                            }
                        }
                    }
                    TableBody {
                        TableRow {
                            TableDataCell(headers: "emp-id") {
                                HTMLText("001")
                            }
                            TableDataCell(headers: "emp-name") {
                                HTMLText("John Doe")
                            }
                            TableDataCell(headers: "emp-dept") {
                                HTMLText("Engineering")
                            }
                            TableDataCell(headers: "emp-salary") {
                                HTMLText("$75,000")
                            }
                        }
                        TableRow {
                            TableDataCell(headers: "emp-id") {
                                HTMLText("002")
                            }
                            TableDataCell(headers: "emp-name") {
                                HTMLText("Jane Smith")
                            }
                            TableDataCell(headers: "emp-dept") {
                                HTMLText("Marketing")
                            }
                            TableDataCell(headers: "emp-salary") {
                                HTMLText("$65,000")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <caption>Employee Information
                  </caption>
                  <thead>
                    <tr>
                      <th scope="col">ID
                      </th>
                      <th scope="col">Name
                      </th>
                      <th scope="col">Department
                      </th>
                      <th scope="col">Salary
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td headers="emp-id">001
                      </td>
                      <td headers="emp-name">John Doe
                      </td>
                      <td headers="emp-dept">Engineering
                      </td>
                      <td headers="emp-salary">$75,000
                      </td>
                    </tr>
                    <tr>
                      <td headers="emp-id">002
                      </td>
                      <td headers="emp-name">Jane Smith
                      </td>
                      <td headers="emp-dept">Marketing
                      </td>
                      <td headers="emp-salary">$65,000
                      </td>
                    </tr>
                  </tbody>
                </table>
                """
            }
        }

        @Test("TableHead within HTMLDocument renders correctly")
        func tableHeadWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Quarterly Sales Report")
                        }
                        Paragraph {
                            HTMLText(
                                "The following table shows our sales performance across different regions for Q1 2024:"
                            )
                        }
                        Table {
                            Caption {
                                StrongImportance {
                                    HTMLText("Q1 2024 Sales by Region")
                                }
                                //                            BR()
                                Small {
                                    HTMLText("All figures in USD thousands")
                                }
                            }
                            TableHead {
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Region")
                                    }
                                    TableHeader(
                                        colspan: "3",
                                        scope: "colgroup"
                                    ) {
                                        HTMLText("Sales Metrics")
                                    }
                                    TableHeader(rowspan: 2, scope: "col") {
                                        HTMLText("Growth %")
                                    }
                                }
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Q1 Total")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("January")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("February")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("March")
                                    }
                                }
                            }
                            TableBody {
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("North America")
                                    }
                                    TableDataCell {
                                        HTMLText("1,250")
                                    }
                                    TableDataCell {
                                        HTMLText("400")
                                    }
                                    TableDataCell {
                                        HTMLText("425")
                                    }
                                    TableDataCell {
                                        HTMLText("425")
                                    }
                                    TableDataCell {
                                        HTMLText("+12.5%")
                                    }
                                }
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Europe")
                                    }
                                    TableDataCell {
                                        HTMLText("980")
                                    }
                                    TableDataCell {
                                        HTMLText("320")
                                    }
                                    TableDataCell {
                                        HTMLText("330")
                                    }
                                    TableDataCell {
                                        HTMLText("330")
                                    }
                                    TableDataCell {
                                        HTMLText("+8.7%")
                                    }
                                }
                            }
                            TableFoot {
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Total")
                                    }
                                    TableDataCell {
                                        HTMLText("2,230")
                                    }
                                    TableDataCell {
                                        HTMLText("720")
                                    }
                                    TableDataCell {
                                        HTMLText("755")
                                    }
                                    TableDataCell {
                                        HTMLText("755")
                                    }
                                    TableDataCell {
                                        HTMLText("+10.6%")
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
                  <h2>Quarterly Sales Report
                  </h2>
                  <p>The following table shows our sales performance across different regions for Q1 2024:
                  </p>
                  <table>
                    <caption><strong>Q1 2024 Sales by Region</strong><small>All figures in USD thousands</small>
                    </caption>
                    <thead>
                      <tr>
                        <th scope="col">Region
                        </th>
                        <th scope="colgroup" colspan="3">Sales Metrics
                        </th>
                        <th scope="col" rowspan="2">Growth %
                        </th>
                      </tr>
                      <tr>
                        <th scope="col">Q1 Total
                        </th>
                        <th scope="col">January
                        </th>
                        <th scope="col">February
                        </th>
                        <th scope="col">March
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">North America
                        </th>
                        <td>1,250
                        </td>
                        <td>400
                        </td>
                        <td>425
                        </td>
                        <td>425
                        </td>
                        <td>+12.5%
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">Europe
                        </th>
                        <td>980
                        </td>
                        <td>320
                        </td>
                        <td>330
                        </td>
                        <td>330
                        </td>
                        <td>+8.7%
                        </td>
                      </tr>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th scope="row">Total
                        </th>
                        <td>2,230
                        </td>
                        <td>720
                        </td>
                        <td>755
                        </td>
                        <td>755
                        </td>
                        <td>+10.6%
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
