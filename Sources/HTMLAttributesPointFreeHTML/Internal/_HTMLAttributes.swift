//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 04/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    @HTMLBuilder
    package func attribute(
        _ value: String,
        _ condition: @autoclosure () -> Bool?
    ) -> some PointFreeHTML.HTML {
        let conditionResult = condition()
        if conditionResult == true {
            self.attribute(value, "")
        } else {
            self.attribute("", String?.none)
        }
    }

    @HTMLBuilder
    package func attribute<Attribute: WHATWG_HTML.BooleanAttribute>(
        boolean value: Attribute?
    ) -> some PointFreeHTML.HTML {
        self.attribute(Attribute.attribute, value == true)
    }
}

extension _HTMLAttributes {
    package func attribute(
        _ name: String,
        _ value: (some CustomStringConvertible)? = ""
    ) -> _HTMLAttributes<Content> {
        self.attribute(name, value?.description)
    }
}
