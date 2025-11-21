import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Table Element Tests")
    struct TableTests {
        @Test("Basic table renders correctly")
        func basicTableRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    TableRow {
                        TableHeader {
                            HTMLText("Name")
                        }
                        TableHeader {
                            HTMLText("Age")
                        }
                    }
                    TableRow {
                        TableDataCell {
                            HTMLText("John")
                        }
                        TableDataCell {
                            HTMLText("30")
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <tr>
                    <th>Name
                    </th>
                    <th>Age
                    </th>
                  </tr>
                  <tr>
                    <td>John
                    </td>
                    <td>30
                    </td>
                  </tr>
                </table>
                """
            }
        }

        @Test("Table with caption renders correctly")
        func tableWithCaptionRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    Caption {
                        HTMLText("Employee Information")
                    }
                    TableRow {
                        TableHeader {
                            HTMLText("Name")
                        }
                        TableHeader {
                            HTMLText("Department")
                        }
                    }
                    TableRow {
                        TableDataCell {
                            HTMLText("Alice")
                        }
                        TableDataCell {
                            HTMLText("Engineering")
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <caption>Employee Information
                  </caption>
                  <tr>
                    <th>Name
                    </th>
                    <th>Department
                    </th>
                  </tr>
                  <tr>
                    <td>Alice
                    </td>
                    <td>Engineering
                    </td>
                  </tr>
                </table>
                """
            }
        }

        @Test("Table with thead, tbody, and tfoot renders correctly")
        func tableWithTheadTbodyAndTfootRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
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
                                HTMLText("Laptop")
                            }
                            TableDataCell {
                                HTMLText("$999")
                            }
                        }
                        TableRow {
                            TableDataCell {
                                HTMLText("Mouse")
                            }
                            TableDataCell {
                                HTMLText("$25")
                            }
                        }
                    }
                    TableFoot {
                        TableRow {
                            TableDataCell {
                                HTMLText("Total")
                            }
                            TableDataCell {
                                HTMLText("$1024")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

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
                      <td>Laptop
                      </td>
                      <td>$999
                      </td>
                    </tr>
                    <tr>
                      <td>Mouse
                      </td>
                      <td>$25
                      </td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td>Total
                      </td>
                      <td>$1024
                      </td>
                    </tr>
                  </tfoot>
                </table>
                """
            }
        }

        @Test("Table with colgroup renders correctly")
        func tableWithColgroupRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    TableColumnGroup {
                        TableColumn(span: 2) {
                            HTMLEmpty()
                        }
                        TableColumn {
                            HTMLEmpty()
                        }
                    }
                    TableRow {
                        TableHeader {
                            HTMLText("First Name")
                        }
                        TableHeader {
                            HTMLText("Last Name")
                        }
                        TableHeader {
                            HTMLText("Age")
                        }
                    }
                    TableRow {
                        TableDataCell {
                            HTMLText("John")
                        }
                        TableDataCell {
                            HTMLText("Doe")
                        }
                        TableDataCell {
                            HTMLText("30")
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <colgroup>
                    <col span="2">
                    <col>
                  </colgroup>
                  <tr>
                    <th>First Name
                    </th>
                    <th>Last Name
                    </th>
                    <th>Age
                    </th>
                  </tr>
                  <tr>
                    <td>John
                    </td>
                    <td>Doe
                    </td>
                    <td>30
                    </td>
                  </tr>
                </table>
                """
            }
        }

        @Test("Table within HTMLDocument renders correctly")
        func tableWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        H2 {
                            HTMLText("Sales Report")
                        }
                        Table {
                            Caption {
                                HTMLText("Q1 2024 Sales Data")
                            }
                            TableHead {
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Month")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Revenue")
                                    }
                                }
                            }
                            TableBody {
                                TableRow {
                                    TableDataCell {
                                        HTMLText("January")
                                    }
                                    TableDataCell {
                                        HTMLText("$10,000")
                                    }
                                }
                                TableRow {
                                    TableDataCell {
                                        HTMLText("February")
                                    }
                                    TableDataCell {
                                        HTMLText("$12,000")
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
                  <h2>Sales Report
                  </h2>
                  <table>
                    <caption>Q1 2024 Sales Data
                    </caption>
                    <thead>
                      <tr>
                        <th scope="col">Month
                        </th>
                        <th scope="col">Revenue
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>January
                        </td>
                        <td>$10,000
                        </td>
                      </tr>
                      <tr>
                        <td>February
                        </td>
                        <td>$12,000
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
