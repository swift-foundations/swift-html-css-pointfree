//
//  Low.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the low attribute on an element
    @discardableResult
    package func low(
        _ value: Low?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Low.attribute, value?.description)
    }
}
