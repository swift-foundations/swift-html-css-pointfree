import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("TableBody Element Tests")
    struct TableBodyTests {
        @Test("Basic tbody renders correctly")
        func basicTbodyRendersCorrectly() {
            assertInlineSnapshot(
                of: TableBody {
                    TableRow {
                        TableDataCell {
                            HTMLText("John")
                        }
                        TableDataCell {
                            HTMLText("25")
                        }
                        TableDataCell {
                            HTMLText("Engineer")
                        }
                    }
                    TableRow {
                        TableDataCell {
                            HTMLText("Jane")
                        }
                        TableDataCell {
                            HTMLText("30")
                        }
                        TableDataCell {
                            HTMLText("Designer")
                        }
                    }
                },
                as: .html
            ) {
                """

                <tbody>
                  <tr>
                    <td>John
                    </td>
                    <td>25
                    </td>
                    <td>Engineer
                    </td>
                  </tr>
                  <tr>
                    <td>Jane
                    </td>
                    <td>30
                    </td>
                    <td>Designer
                    </td>
                  </tr>
                </tbody>
                """
            }
        }

        @Test("Tbody with row headers renders correctly")
        func tbodyWithRowHeadersRendersCorrectly() {
            assertInlineSnapshot(
                of: TableBody {
                    TableRow {
                        TableHeader(scope: "row") {
                            HTMLText("Q1")
                        }
                        TableDataCell {
                            HTMLText("$50,000")
                        }
                        TableDataCell {
                            HTMLText("$55,000")
                        }
                        TableDataCell {
                            HTMLText("$52,000")
                        }
                    }
                    TableRow {
                        TableHeader(scope: "row") {
                            HTMLText("Q2")
                        }
                        TableDataCell {
                            HTMLText("$60,000")
                        }
                        TableDataCell {
                            HTMLText("$65,000")
                        }
                        TableDataCell {
                            HTMLText("$62,000")
                        }
                    }
                },
                as: .html
            ) {
                """

                <tbody>
                  <tr>
                    <th scope="row">Q1
                    </th>
                    <td>$50,000
                    </td>
                    <td>$55,000
                    </td>
                    <td>$52,000
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Q2
                    </th>
                    <td>$60,000
                    </td>
                    <td>$65,000
                    </td>
                    <td>$62,000
                    </td>
                  </tr>
                </tbody>
                """
            }
        }

        @Test("Tbody with styling classes renders correctly")
        func tbodyWithStylingClassesRendersCorrectly() {
            assertInlineSnapshot(
                of: TableBody {
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
                            HTMLText("$70,000")
                        }
                    }
                },
                as: .html
            ) {
                """

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
                    <td>$70,000
                    </td>
                  </tr>
                </tbody>
                """
            }
        }

        @Test("Tbody with complex content renders correctly")
        func tbodyWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: TableBody {
                    TableRow {
                        TableDataCell {
                            StrongImportance {
                                HTMLText("Premium Plan")
                            }
                        }
                        TableDataCell {
                            HTMLText("$29.99/month")
                        }
                        TableDataCell {
                            UnorderedList {
                                ListItem {
                                    HTMLText("Unlimited storage")
                                }
                                ListItem {
                                    HTMLText("Priority support")
                                }
                                ListItem {
                                    HTMLText("Advanced analytics")
                                }
                            }
                        }
                        TableDataCell {
                            Button {
                                HTMLText("Choose Plan")
                            }
                        }
                    }
                    TableRow {
                        TableDataCell {
                            StrongImportance {
                                HTMLText("Basic Plan")
                            }
                        }
                        TableDataCell {
                            HTMLText("$9.99/month")
                        }
                        TableDataCell {
                            UnorderedList {
                                ListItem {
                                    HTMLText("5GB storage")
                                }
                                ListItem {
                                    HTMLText("Email support")
                                }
                                ListItem {
                                    HTMLText("Basic reports")
                                }
                            }
                        }
                        TableDataCell {
                            Button {
                                HTMLText("Choose Plan")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <tbody>
                  <tr>
                    <td><strong>Premium Plan</strong>
                    </td>
                    <td>$29.99/month
                    </td>
                    <td>
                      <ul>
                        <li>Unlimited storage
                        </li>
                        <li>Priority support
                        </li>
                        <li>Advanced analytics
                        </li>
                      </ul>
                    </td>
                    <td><button>Choose Plan</button>
                    </td>
                  </tr>
                  <tr>
                    <td><strong>Basic Plan</strong>
                    </td>
                    <td>$9.99/month
                    </td>
                    <td>
                      <ul>
                        <li>5GB storage
                        </li>
                        <li>Email support
                        </li>
                        <li>Basic reports
                        </li>
                      </ul>
                    </td>
                    <td><button>Choose Plan</button>
                    </td>
                  </tr>
                </tbody>
                """
            }
        }

        @Test("Multiple tbody elements render correctly")
        func multipleTbodyElementsRenderCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    Caption {
                        HTMLText("Sales Data by Region")
                    }
                    TableHead {
                        TableRow {
                            TableHeader(scope: "col") {
                                HTMLText("City")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Q1 Sales")
                            }
                            TableHeader(scope: "col") {
                                HTMLText("Q2 Sales")
                            }
                        }
                    }
                    TableBody {
                        TableRow {
                            TableHeader(scope: "row") {
                                HTMLText("New York")
                            }
                            TableDataCell {
                                HTMLText("$125,000")
                            }
                            TableDataCell {
                                HTMLText("$140,000")
                            }
                        }
                        TableRow {
                            TableHeader(scope: "row") {
                                HTMLText("Toronto")
                            }
                            TableDataCell {
                                HTMLText("$98,000")
                            }
                            TableDataCell {
                                HTMLText("$105,000")
                            }
                        }
                    }
                    TableBody {
                        TableRow {
                            TableHeader(scope: "row") {
                                HTMLText("London")
                            }
                            TableDataCell {
                                HTMLText("$87,000")
                            }
                            TableDataCell {
                                HTMLText("$92,000")
                            }
                        }
                        TableRow {
                            TableHeader(scope: "row") {
                                HTMLText("Paris")
                            }
                            TableDataCell {
                                HTMLText("$65,000")
                            }
                            TableDataCell {
                                HTMLText("$68,000")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <caption>Sales Data by Region
                  </caption>
                  <thead>
                    <tr>
                      <th scope="col">City
                      </th>
                      <th scope="col">Q1 Sales
                      </th>
                      <th scope="col">Q2 Sales
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">New York
                      </th>
                      <td>$125,000
                      </td>
                      <td>$140,000
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">Toronto
                      </th>
                      <td>$98,000
                      </td>
                      <td>$105,000
                      </td>
                    </tr>
                  </tbody>
                  <tbody>
                    <tr>
                      <th scope="row">London
                      </th>
                      <td>$87,000
                      </td>
                      <td>$92,000
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">Paris
                      </th>
                      <td>$65,000
                      </td>
                      <td>$68,000
                      </td>
                    </tr>
                  </tbody>
                </table>
                """
            }
        }

        @Test("TableBody within HTMLDocument renders correctly")
        func tableBodyWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Product Comparison")
                        }
                        Paragraph {
                            HTMLText(
                                "Compare our product offerings to find the right solution for your needs:"
                            )
                        }
                        Table {
                            Caption {
                                StrongImportance {
                                    HTMLText("Product Feature Comparison")
                                }
                                //                            BR()
                                Small {
                                    HTMLText("Updated as of January 2024")
                                }
                            }
                            TableHead {
                                TableRow {
                                    TableHeader(scope: "col") {
                                        HTMLText("Feature")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Basic")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Professional")
                                    }
                                    TableHeader(scope: "col") {
                                        HTMLText("Enterprise")
                                    }
                                }
                            }
                            TableBody {
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Storage Space")
                                    }
                                    TableDataCell {
                                        HTMLText("5 GB")
                                    }
                                    TableDataCell {
                                        HTMLText("100 GB")
                                    }
                                    TableDataCell {
                                        HTMLText("Unlimited")
                                    }
                                }
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Users")
                                    }
                                    TableDataCell {
                                        HTMLText("1 User")
                                    }
                                    TableDataCell {
                                        HTMLText("5 Users")
                                    }
                                    TableDataCell {
                                        HTMLText("Unlimited")
                                    }
                                }
                                TableRow {
                                    TableHeader(scope: "row") {
                                        HTMLText("Support")
                                    }
                                    TableDataCell {
                                        HTMLText("Email")
                                    }
                                    TableDataCell {
                                        HTMLText("Email + Chat")
                                    }
                                    TableDataCell {
                                        HTMLText("24/7 Phone + Dedicated Manager")
                                    }
                                }
                                TableRow {
                                    TableHeader(scope: "row") {
                                        StrongImportance {
                                            HTMLText("Monthly Price")
                                        }
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("$9.99")
                                        }
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("$29.99")
                                        }
                                        //                                    BR()
                                        Small {
                                            HTMLText("Most Popular")
                                        }
                                    }
                                    TableDataCell {
                                        StrongImportance {
                                            HTMLText("Custom")
                                        }
                                    }
                                }
                            }
                            TableFoot {
                                TableRow {
                                    TableDataCell {
                                        HTMLText("Action")
                                    }
                                    TableDataCell {
                                        Button {
                                            HTMLText("Get Started")
                                        }
                                    }
                                    TableDataCell {
                                        Button {
                                            HTMLText("Start Free Trial")
                                        }
                                    }
                                    TableDataCell {
                                        Button {
                                            HTMLText("Contact Sales")
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
                <article>
                  <h2>Product Comparison
                  </h2>
                  <p>Compare our product offerings to find the right solution for your needs:
                  </p>
                  <table>
                    <caption><strong>Product Feature Comparison</strong><small>Updated as of January 2024</small>
                    </caption>
                    <thead>
                      <tr>
                        <th scope="col">Feature
                        </th>
                        <th scope="col">Basic
                        </th>
                        <th scope="col">Professional
                        </th>
                        <th scope="col">Enterprise
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">Storage Space
                        </th>
                        <td>5 GB
                        </td>
                        <td>100 GB
                        </td>
                        <td>Unlimited
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">Users
                        </th>
                        <td>1 User
                        </td>
                        <td>5 Users
                        </td>
                        <td>Unlimited
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">Support
                        </th>
                        <td>Email
                        </td>
                        <td>Email + Chat
                        </td>
                        <td>24/7 Phone + Dedicated Manager
                        </td>
                      </tr>
                      <tr>
                        <th scope="row"><strong>Monthly Price</strong>
                        </th>
                        <td><strong>$9.99</strong>
                        </td>
                        <td><strong>$29.99</strong><small>Most Popular</small>
                        </td>
                        <td><strong>Custom</strong>
                        </td>
                      </tr>
                    </tbody>
                    <tfoot>
                      <tr>
                        <td>Action
                        </td>
                        <td><button>Get Started</button>
                        </td>
                        <td><button>Start Free Trial</button>
                        </td>
                        <td><button>Contact Sales</button>
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
