import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct InputTypeTests {
        @Test("Fully initialized Input renders correctly")
        func fullyInitializedInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "test",
                    disabled: true,
                    form: nil,
                    type: .image(
                        .init(
                            src: "src",
                            alt: "alt",
                            height: 100,
                            width: 200,
                            form: .init(
                                action: "action",
                                enctype: .multipartFormData,
                                method: .post,
                                novalidate: true,
                                target: .top
                            )
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input formtarget="_top" formnovalidate formmethod="post" formenctype="multipart/form-data" formaction="action" src="src" width="200" height="100" alt="alt" type="image" disabled name="test">
                """
            }
        }

        @Test("Button input renders correctly")
        func buttonInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "buttonInput",
                    type: .button(
                        .init(
                            value: "Click Me"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="Click Me" type="button" name="buttonInput">
                """
            }
        }

        @Test("Checkbox input renders correctly")
        func checkboxInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "interestCoding",
                    type: .checkbox(
                        .init(
                            value: "coding",
                            checked: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input checked value="coding" type="checkbox" name="interestCoding">
                """
            }
        }

        @Test("Color input renders correctly")
        func colorInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "favoriteColor",
                    type: .color(
                        .init(
                            value: "#ff0000"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="#ff0000" type="color" name="favoriteColor">
                """
            }
        }

        @Test("Date input renders correctly")
        func dateInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "trip-start",
                    type: .date(
                        .init(
                            value: "2018-07-22",
                            min: "2018-01-01",
                            max: "2018-12-31",
                            step: 7
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="7.0" max="2018-12-31" min="2018-01-01" value="2018-07-22" type="date" name="trip-start">
                """
            }
        }

        @Test("Datetime-local input renders correctly")
        func datetimeLocalInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "meeting-time",
                    type: .datetimeLocal(
                        .init(
                            value: "2018-06-12T19:30",
                            min: "2018-06-07T00:00",
                            max: "2018-06-14T00:00",
                            step: 60
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="60.0" max="2018-06-14T00:00" min="2018-06-07T00:00" value="2018-06-12T19:30" type="datetime-local" name="meeting-time">
                """
            }
        }

        @Test("Email input renders correctly")
        func emailInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "email",
                    disabled: nil,
                    form: nil,
                    type: .email(
                        .init(
                            value: "user@example.com",
                            maxlength: 64,
                            minlength: 5,
                            multiple: true,
                            pattern: ".+@example\\.com",
                            placeholder: "username@example.com",
                            readonly: false,
                            size: 30
                        )
                    )
                ),
                as: .html
            ) {
                #"""
                <input size="30" placeholder="username@example.com" pattern=".+@example\.com" multiple minlength="5" maxlength="64" value="user@example.com" type="email" name="email">
                """#
            }
        }

        @Test("File input renders correctly")
        func fileInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "avatar",
                    disabled: nil,
                    form: nil,
                    type: .file(
                        .init(
                            accept: .init(.png, .jpeg),
                            capture: "user",
                            multiple: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input multiple capture="user" accept="image/png, image/jpeg" type="file" name="avatar">
                """
            }
        }

        @Test("Hidden input renders correctly")
        func hiddenInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "postId",
                    disabled: nil,
                    form: nil,
                    type: .hidden(
                        .init(
                            value: "34657"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="34657" type="hidden" name="postId">
                """
            }
        }

        @Test("Number input renders correctly with specific step")
        func numberInputWithSpecificStepRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "quantity",
                    disabled: nil,
                    form: nil,
                    type: .number(
                        .init(
                            value: "10",
                            min: 1,
                            max: 100,
                            placeholder: "Multiple of 10",
                            readonly: false,
                            step: 10
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="10.0" placeholder="Multiple of 10" max="100" min="1" value="10" type="number" name="quantity">
                """
            }
        }

        @Test("Number input renders correctly with step any")
        func numberInputWithStepAnyRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "price",
                    disabled: nil,
                    form: nil,
                    type: .number(
                        .init(
                            value: "9.99",
                            min: 0,
                            max: nil,
                            placeholder: "Enter price",
                            readonly: nil,
                            step: .any
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="any" placeholder="Enter price" min="0" value="9.99" type="number" name="price">
                """
            }
        }

        @Test("Password input renders correctly")
        func passwordInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "password",
                    disabled: nil,
                    form: nil,
                    type: .password(
                        .init(
                            value: nil,
                            maxlength: 64,
                            minlength: 8,
                            pattern: "[A-Za-z0-9\\d@$!%*?&]{8,}",
                            placeholder: "Enter password",
                            readonly: false,
                            size: 30,
                            autocomplete: "new-password"
                        )
                    )
                )
                .inputmode(.text),
                as: .html
            ) {
                #"""
                <input inputmode="text" autocomplete="new-password" size="30" placeholder="Enter password" pattern="[A-Za-z0-9\d@$!%*?&amp;]{8,}" minlength="8" maxlength="64" type="password" name="password">
                """#
            }
        }

        @Test("Password input for PIN renders correctly")
        func passwordInputForPINRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "pin",
                    disabled: nil,
                    form: nil,
                    type: .password(
                        .init(
                            value: nil,
                            maxlength: 8,
                            minlength: 4,
                            pattern: "\\d{4,8}",
                            placeholder: "Enter PIN",
                            readonly: nil,
                            size: 8,
                            autocomplete: "one-time-code"
                        )
                    )
                )
                .inputmode(.numeric),
                as: .html
            ) {
                #"""
                <input inputmode="numeric" autocomplete="one-time-code" size="8" placeholder="Enter PIN" pattern="\d{4,8}" minlength="4" maxlength="8" type="password" name="pin">
                """#
            }
        }

        @Test("Radio input renders correctly")
        func radioInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "drone",
                    disabled: nil,
                    form: nil,
                    type: .radio(
                        .init(
                            value: "huey",
                            checked: true,
                            required: nil
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input checked value="huey" type="radio" name="drone">
                """
            }
        }

        @Test("Radio input with required renders correctly")
        func radioInputWithRequiredRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "contact",
                    disabled: nil,
                    form: nil,
                    type: .radio(
                        .init(
                            value: "email",
                            checked: false,
                            required: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input required value="email" type="radio" name="contact">
                """
            }
        }

        @Test("Range input renders correctly")
        func rangeInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "volume",
                    disabled: nil,
                    form: nil,
                    type: .range(
                        .init(
                            value: "50",
                            min: 0,
                            max: 100,
                            step: 1,
                            list: nil
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="1.0" max="100" min="0" value="50" type="range" name="volume">
                """
            }
        }

        @Test("Range input with step any and list renders correctly")
        func rangeInputWithStepAnyAndListRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "temperature",
                    disabled: nil,
                    form: nil,
                    type: .range(
                        .init(
                            value: "25",
                            min: 0,
                            max: 100,
                            step: .any,
                            list: "values"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input list="values" step="any" max="100" min="0" value="25" type="range" name="temperature">
                """
            }
        }

        @Test("Reset input renders correctly")
        func resetInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "reset",
                    disabled: nil,
                    form: nil,
                    type: .reset(
                        .init(
                            value: "Reset the form"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="Reset the form" type="reset" name="reset">
                """
            }
        }

        @Test("Reset input with default value renders correctly")
        func resetInputWithDefaultValueRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "reset",
                    disabled: nil,
                    form: nil,
                    type: .reset(
                        .init()
                    )
                ),
                as: .html
            ) {
                """
                <input type="reset" name="reset">
                """
            }
        }

        @Test("Submit input renders correctly")
        func submitInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "submit",
                    type: .submit(
                        .init(
                            value: "Send Form"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="Send Form" type="submit" name="submit">
                """
            }
        }

        //    @Test("Submit input with form attributes renders correctly")
        //    func submitInputWithFormAttributesRendersCorrectly() {
        //        assertInlineSnapshot(
        //            of: Input(
        //                name: "submit",
        //                disabled: nil,
        //                form: nil,
        //                type: .submit(
        //                    .init(
        //                        value: "Submit",
        //                        formaction: "https://example.com/submit",
        //                        formenctype: .multipartFormData,
        //                        formmethod: .post,
        //                        formnovalidate: true,
        //                        formtarget: .blank
        //                    )
        //                )
        //            ),
        //            as: .html
        //        ) {
        //            """
        //            <input value="Submit" type="submit" formaction="https://example.com/submit" formenctype="multipart/form-data" formmethod="post" formnovalidate formtarget="_blank" name="submit">
        //            """
        //        }
        //    }

        @Test("Tel input renders correctly")
        func telInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "phone",
                    type: .tel(
                        .init(
                            value: "555-123-4567",
                            pattern: "[0-9]{3}-[0-9]{3}-[0-9]{4}"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="555-123-4567" type="tel" name="phone">
                """
            }
        }

        @Test("Tel input with validation attributes renders correctly")
        func telInputWithValidationAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "phone",
                    type: .tel(
                        .init(
                            value: nil,
                            list: "phone-formats",
                            maxlength: 15,
                            minlength: 7,
                            pattern: "[0-9]{3}-[0-9]{3}-[0-9]{4}",
                            placeholder: "Format: 123-456-7890",
                            readonly: false,
                            size: 20,
                            required: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input required size="20" placeholder="Format: 123-456-7890" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" minlength="7" maxlength="15" list="phone-formats" type="tel" name="phone">
                """
            }
        }

        @Test("Text input renders correctly")
        func textInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "username",
                    type: .text(
                        .init(
                            value: "johndoe"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="johndoe" type="text" name="username">
                """
            }
        }

        @Test("Text input with validation attributes renders correctly")
        func textInputWithValidationAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "username",
                    type: .text(
                        .init(
                            value: nil,
                            list: "usernames",
                            maxlength: 20,
                            minlength: 3,
                            pattern: "[a-z0-9]{3,20}",
                            placeholder: "Enter username",
                            readonly: false,
                            size: 30,
                            spellcheck: true,
                            required: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input required spellcheck="true" size="30" placeholder="Enter username" pattern="[a-z0-9]{3,20}" minlength="3" maxlength="20" list="usernames" type="text" name="username">
                """
            }
        }

        @Test("Time input renders correctly")
        func timeInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "appointment",
                    type: .time(
                        .init(
                            value: "13:30"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="13:30" type="time" name="appointment">
                """
            }
        }

        @Test("Time input with min, max and step renders correctly")
        func timeInputWithMinMaxAndStepRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "appointment",
                    type: .time(
                        .init(
                            value: "13:30",
                            list: "available-times",
                            min: "09:00",
                            max: "18:00",
                            readonly: false,
                            step: 30,
                            required: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input required step="30.0" max="18:00" min="09:00" list="available-times" value="13:30" type="time" name="appointment">
                """
            }
        }

        @Test("Time input with step=any renders correctly")
        func timeInputWithStepAnyRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "appointment",
                    type: .time(
                        .init(
                            value: "13:30:45",
                            min: "09:00",
                            max: "18:00",
                            step: .any
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="any" max="18:00" min="09:00" value="13:30:45" type="time" name="appointment">
                """
            }
        }

        @Test("URL input renders correctly")
        func urlInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "website",
                    type: .url(
                        .init(
                            value: "https://example.com"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="https://example.com" type="url" name="website">
                """
            }
        }

        @Test("URL input with validation attributes renders correctly")
        func urlInputWithValidationAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "website",
                    type: .url(
                        .init(
                            value: nil,
                            list: "website-suggestions",
                            maxlength: 100,
                            minlength: 10,
                            pattern: "https://.*\\.mydomain\\.com",
                            placeholder: "https://example.mydomain.com",
                            readonly: false,
                            size: 50,
                            spellcheck: false,
                            required: true
                        )
                    )
                ),
                as: .html
            ) {
                #"""
                <input required spellcheck="false" size="50" placeholder="https://example.mydomain.com" pattern="https://.*\.mydomain\.com" minlength="10" maxlength="100" list="website-suggestions" type="url" name="website">
                """#
            }
        }

        @Test("Week input renders correctly")
        func weekInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "week",
                    type: .week(
                        .init(
                            value: "2023-W12"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="2023-W12" type="week" name="week">
                """
            }
        }

        @Test("Week input with min, max and step renders correctly")
        func weekInputWithMinMaxAndStepRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "week",
                    type: .week(
                        .init(
                            value: "2023-W12",
                            list: "available-weeks",
                            min: "2023-W01",
                            max: "2023-W52",
                            readonly: false,
                            step: 2,
                            required: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input required step="2.0" max="2023-W52" min="2023-W01" list="available-weeks" value="2023-W12" type="week" name="week">
                """
            }
        }

        @Test("Week input with step=any renders correctly")
        func weekInputWithStepAnyRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "week",
                    type: .week(
                        .init(
                            value: "2023-W12",
                            min: "2023-W01",
                            max: "2023-W52",
                            step: .any
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="any" max="2023-W52" min="2023-W01" value="2023-W12" type="week" name="week">
                """
            }
        }

        @Test("Month input renders correctly")
        func monthInputRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "month",
                    type: .month(
                        .init(
                            value: "2023-07"
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input value="2023-07" type="month" name="month">
                """
            }
        }

        @Test("Month input with min, max and step renders correctly")
        func monthInputWithMinMaxAndStepRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "month",
                    type: .month(
                        .init(
                            value: "2023-07",
                            list: "available-months",
                            min: "2023-01",
                            max: "2023-12",
                            readonly: false,
                            step: 2,
                            required: true
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input required step="2.0" max="2023-12" min="2023-01" list="available-months" value="2023-07" type="month" name="month">
                """
            }
        }

        @Test("Month input with step=any renders correctly")
        func monthInputWithStepAnyRendersCorrectly() {
            assertInlineSnapshot(
                of: Input(
                    name: "month",
                    type: .month(
                        .init(
                            value: "2023-07",
                            min: "2023-01",
                            max: "2023-12",
                            step: .any
                        )
                    )
                ),
                as: .html
            ) {
                """
                <input step="any" max="2023-12" min="2023-01" value="2023-07" type="month" name="month">
                """
            }
        }
    }
}
