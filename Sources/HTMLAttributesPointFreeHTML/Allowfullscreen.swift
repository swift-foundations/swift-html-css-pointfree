//
//  Allowfullscreen.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the allowfullscreen attribute on an element
    @discardableResult
    package func allowfullscreen(
        _ value: Allowfullscreen?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
