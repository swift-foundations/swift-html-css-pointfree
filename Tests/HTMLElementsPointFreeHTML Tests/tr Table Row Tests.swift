import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct TableRowTests {
        @Test("Basic tr renders correctly")
        func basicTrRendersCorrectly() {
            assertInlineSnapshot(
                of: TableRow {
                    TableDataCell {
                        HTMLText("Cell 1")
                    }
                    TableDataCell {
                        HTMLText("Cell 2")
                    }
                },
                as: .html
            ) {
                """

                <tr>
                  <td>Cell 1
                  </td>
                  <td>Cell 2
                  </td>
                </tr>
                """
            }
        }

        @Test("Tr with headers renders correctly")
        func trWithHeadersRendersCorrectly() {
            assertInlineSnapshot(
                of: TableRow {
                    TableHeader {
                        HTMLText("Name")
                    }
                    TableHeader {
                        HTMLText("Age")
                    }
                    TableHeader {
                        HTMLText("City")
                    }
                },
                as: .html
            ) {
                """

                <tr>
                  <th>Name
                  </th>
                  <th>Age
                  </th>
                  <th>City
                  </th>
                </tr>
                """
            }
        }

        @Test("Tr with mixed headers and data renders correctly")
        func trWithMixedHeadersAndDataRendersCorrectly() {
            assertInlineSnapshot(
                of: TableRow {
                    TableHeader(scope: "row") {
                        HTMLText("Total")
                    }
                    TableDataCell {
                        HTMLText("$1,250")
                    }
                    TableDataCell {
                        HTMLText("$1,500")
                    }
                },
                as: .html
            ) {
                """

                <tr>
                  <th scope="row">Total
                  </th>
                  <td>$1,250
                  </td>
                  <td>$1,500
                  </td>
                </tr>
                """
            }
        }

        @Test("Tr with complex content renders correctly")
        func trWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: TableRow {
                    TableDataCell {
                        StrongImportance {
                            HTMLText("John Doe")
                        }
                    }
                    TableDataCell {
                        Anchor(href: "mailto:john@example.com") {
                            HTMLText("john@example.com")
                        }
                    }
                    TableDataCell {
                        ContentSpan {
                            HTMLText("Active")
                        }
                    }
                },
                as: .html
            ) {
                """

                <tr>
                  <td><strong>John Doe</strong>
                  </td>
                  <td><a href="mailto:john@example.com">john@example.com</a>
                  </td>
                  <td><span>Active</span>
                  </td>
                </tr>
                """
            }
        }

        @Test("TableRow within HTMLDocument renders correctly")
        func tableRowWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Table {
                            TableHead {
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Employee ID")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Full Name")
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
                                    TableDataCell {
                                        HTMLText("001")
                                    }
                                    TableDataCell {
                                        HTMLText("Alice Johnson")
                                    }
                                    TableDataCell {
                                        HTMLText("Engineering")
                                    }
                                    TableDataCell {
                                        HTMLText("$85,000")
                                    }
                                }
                                TableRow {
                                    TableDataCell {
                                        HTMLText("002")
                                    }
                                    TableDataCell {
                                        HTMLText("Bob Smith")
                                    }
                                    TableDataCell {
                                        HTMLText("Marketing")
                                    }
                                    TableDataCell {
                                        HTMLText("$65,000")
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
                    <thead>
                      <tr>
                        <th scope="col">Employee ID
                        </th>
                        <th scope="col">Full Name
                        </th>
                        <th scope="col">Department
                        </th>
                        <th scope="col">Salary
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>001
                        </td>
                        <td>Alice Johnson
                        </td>
                        <td>Engineering
                        </td>
                        <td>$85,000
                        </td>
                      </tr>
                      <tr>
                        <td>002
                        </td>
                        <td>Bob Smith
                        </td>
                        <td>Marketing
                        </td>
                        <td>$65,000
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
