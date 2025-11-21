import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct TextareaTests {
        @Test("Basic textarea renders correctly")
        func basicTextareaRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(name: "message") {
                    HTMLText("Default content")
                },
                as: .html
            ) {
                """
                <textarea name="message">Default content</textarea>
                """
            }
        }

        @Test("Textarea with rows and cols renders correctly")
        func textareaWithRowsAndColsRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(
                    cols: 40,
                    name: "comment",
                    rows: 5
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """
                <textarea rows="5" name="comment" cols="40"></textarea>
                """
            }
        }

        @Test("Textarea with validation attributes renders correctly")
        func textareaWithValidationAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(
                    maxlength: 500,
                    minlength: 10,
                    name: "feedback",
                    required: true
                )()
                .attribute("placeholder", "Enter your feedback here..."),
                as: .html
            ) {
                """
                <textarea placeholder="Enter your feedback here..." required name="feedback" minlength="10" maxlength="500"></textarea>
                """
            }
        }

        @Test("Textarea with disabled and readonly renders correctly")
        func textareaWithDisabledAndReadonlyRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(
                    disabled: true,
                    name: "readonly-text",
                    readonly: true
                ) {
                    HTMLText("This text cannot be edited")
                },
                as: .html
            ) {
                """
                <textarea readonly name="readonly-text" disabled>This text cannot be edited</textarea>
                """
            }
        }

        @Test("Textarea with form attributes renders correctly")
        func textareaWithFormAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(
                    form: "contact-form",
                    name: "external-message"
                ) {
                    HTMLEmpty()
                }
                .attribute("autocomplete", "off")
                .attribute("spellcheck", "true"),
                as: .html
            ) {
                """
                <textarea autocomplete="off" spellcheck="true" name="external-message" form="contact-form"></textarea>
                """
            }
        }

        @Test("Textarea with wrap attribute renders correctly")
        func textareaWithWrapAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(
                    cols: 80,
                    name: "code",
                    rows: 10
                ) {
                    HTMLText("function example() {\n  return 'Hello World';\n}")
                }
                .attribute("wrap", "off"),
                as: .html
            ) {
                """
                <textarea wrap="off" rows="10" name="code" cols="80">function example() {
                  return 'Hello World';
                }</textarea>
                """
            }
        }

        @Test("Textarea with resize style renders correctly")
        func textareaWithResizeStyleRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(
                    cols: 50,
                    name: "resizable",
                    rows: 4
                ) {
                    HTMLEmpty()
                }
                .attribute("style", "resize: vertical;"),
                as: .html
            ) {
                """
                <textarea style="resize: vertical;" rows="4" name="resizable" cols="50"></textarea>
                """
            }
        }

        @Test("Empty textarea renders correctly")
        func emptyTextareaRendersCorrectly() {
            assertInlineSnapshot(
                of: Textarea(name: "empty") {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """
                <textarea name="empty"></textarea>
                """
            }
        }
    }
}
