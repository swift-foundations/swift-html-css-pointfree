//
//  As.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the as attribute on an element
    @discardableResult
    package func `as`(
        _ value: As?
    ) -> _HTMLAttributes<Self> {
        self.attribute(As.attribute, value?.rawValue)
    }
}
