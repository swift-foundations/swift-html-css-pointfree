//
//  Loop.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the loop attribute on an element
    @discardableResult
    package func loop(
        _ value: Loop?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
