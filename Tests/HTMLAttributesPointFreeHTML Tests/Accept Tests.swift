// import Testing
// import HTMLAttributesPointFreeHTML
// import PointFreeHTML
// import InlineSnapshotTesting
// import PointFreeHTMLTestSupport
//
// @Suite(
//    "Accept Attribute Tests"
// )
// struct AcceptTests {
//
//    @Test("Input with accept attribute renders correctly")
//    func inputWithAcceptAttributeRendersCorrectly() {
//        assertInlineSnapshot(
//            of: div
//                .attribute("type", "file")
//                .accept("image/*"),
//            as: .html
//        ) {
//            """
//            <input accept="image/*" type="file">
//            """
//        }
//    }
//
//    @Test("Input with multiple file types renders correctly")
//    func inputWithMultipleFileTypesRendersCorrectly() {
//        assertInlineSnapshot(
//            of: div
//                .attribute("type", "file")
//                .accept([".pdf", ".doc", ".docx"]),
//            as: .html
//        ) {
//            """
//            <input accept=".pdf, .doc, .docx" type="file">
//            """
//        }
//    }
//
//    @Test("Input with MIME types renders correctly")
//    func inputWithMimeTypesRendersCorrectly() {
//        assertInlineSnapshot(
//            of: div
//                .attribute("type", "file")
//                .accept("application/pdf,.pdf, application/msword"),
//            as: .html
//        ) {
//            """
//            <input accept="application/pdf,.pdf, application/msword" type="file">
//            """
//        }
//    }
//
//    @Test("Input with MIME types renders correctly")
//    func inputWithMimeTypesRendersCorrectly2() {
//        assertInlineSnapshot(
//            of: div
//                .attribute("type", "file")
//                .accept(.pdf, .msword),
//            as: .html
//        ) {
//            """
//            <input accept="application/pdf,.pdf, application/msword" type="file">
//            """
//        }
//    }
//
//    @Test("Input with mixed accept types renders correctly")
//    func inputWithMixedAcceptTypesRendersCorrectly() {
//        assertInlineSnapshot(
//            of: div
//                .attribute("type", "file")
//                .accept("image/*", ".pdf", "application/msword"),
//            as: .html
//        ) {
//            """
//            <input accept="image/*, .pdf, application/msword" type="file">
//            """
//        }
//    }
//
//    @Test("Form with file input renders correctly")
//    func formWithFileInputRendersCorrectly() {
//        assertInlineSnapshot(
//            of: form {
//                label()
//                    .for("fileUpload")
////                    .text("Upload Images:")
//
//                div
//                    .id("fileUpload")
////                    .attribute("type", "file")
//                    .accept(.image)
//                    .multiple
//            },
//            as: .html
//        ) {
//            """
//
//            <form><label for="fileUpload"></label><input multiple accept="image/*" id="fileUpload">
//            </form>
//            """
//        }
//    }
// }
