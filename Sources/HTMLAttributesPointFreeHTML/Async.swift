//
//  Async.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the async attribute on an element
    @discardableResult
    package func async(
        _ value: Async?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
