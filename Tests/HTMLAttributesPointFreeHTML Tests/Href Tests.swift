// import Testing
// import HTMLAttributesPointFreeHTML
// import PointFreeHTML
// import InlineSnapshotTesting
// import PointFreeHTMLTestSupport
//
// @Suite(
//    "Href Attribute Tests"
// )
// struct HrefTests {
//
//    @Test("Link renders correctly")
//    func linkRendersCorrectly() {
//        assertInlineSnapshot(
//            of: a {
//                "Visit Example"
//            }
//                .href("https://example.com"),
//            as: .html
//        ) {
//            """
//            <a href="https://example.com">Visit Example</a>
//            """
//        }
//    }
//
////    @Test("Email link renders correctly")
////    func emailLinkRendersCorrectly() {
////        assertInlineSnapshot(
////            of: a {
////                "Contact Us"
////            }
////                .emailLink("example@example.com"),
////            as: .html
////        ) {
////            """
////            <a href="mailto:example@example.com">Contact Us</a>
////            """
////        }
////    }
////
////    @Test("Email link with subject renders correctly")
////    func emailLinkWithSubjectRendersCorrectly() {
////        assertInlineSnapshot(
////            of: a {
////                "Contact Us"
////            }
////                .emailLink("example@example.com", subject: "Inquiry"),
////            as: .html
////        ) {
////            """
////            <a href="mailto:example@example.com?subject=Inquiry">Contact Us</a>
////            """
////        }
////    }
////
////    @Test("Telephone link renders correctly")
////    func telephoneLinkRendersCorrectly() {
////        assertInlineSnapshot(
////            of: a {
////                "Call Us"
////            }
////                .telLink("123-456-7890"),
////            as: .html
////        ) {
////            """
////            <a href="tel:1234567890">Call Us</a>
////            """
////        }
////    }
////
////    @Test("SMS link renders correctly")
////    func smsLinkRendersCorrectly() {
////        assertInlineSnapshot(
////            of: a {
////                "Text Us"
////            }
////                .smsLink("123-456-7890", body: "I have a question"),
////            as: .html
////        ) {
////            """
////            <a href="sms:1234567890?body=I%20have%20a%20question">Text Us</a>
////            """
////        }
////    }
////
////    @Test("Fragment link renders correctly")
////    func fragmentLinkRendersCorrectly() {
////        assertInlineSnapshot(
////            of: a {
////                "Go to Section 1"
////            }
////                .fragmentLink("section1"),
////            as: .html
////        ) {
////            """
////            <a href="#section1">Go to Section 1</a>
////            """
////        }
////    }
////
////    @Test("Complete navigation example renders correctly")
////    func completeNavigationExampleRendersCorrectly() {
////        assertInlineSnapshot(
////            of: nav {
////                ul {
////                    li {
////                        a {
////                            "Home"
////                        }
////                            .href("https://example.com")
////                    }
////                    li {
////                        a {
////                            "About"
////                        }
////                            .href("https://example.com/about")
////                    }
////                    li {
////                        a {
////                            "Contact"
////                        }
////                            .href("https://example.com/contact")
////                    }
////                    li {
////                        a {
////                            "Email Us"
////                        }
////                            .emailLink("info@example.com")
////                    }
////                    li {
////                        a {
////                            "Call Us"
////                        }
////                            .telLink("123-456-7890")
////                    }
////                }
////            },
////            as: .html
////        ) {
////            """
////
////            <nav>
////              <ul>
////                <li><a href="https://example.com">Home</a>
////                </li>
////                <li><a href="https://example.com/about">About</a>
////                </li>
////                <li><a href="https://example.com/contact">Contact</a>
////                </li>
////                <li><a href="mailto:info@example.com">Email Us</a>
////                </li>
////                <li><a href="tel:1234567890">Call Us</a>
////                </li>
////              </ul>
////            </nav>
////            """
////        }
////    }
// }
