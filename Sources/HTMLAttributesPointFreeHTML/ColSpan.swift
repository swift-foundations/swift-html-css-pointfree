//
//  ColSpan.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the colspan attribute on an element
    @discardableResult
    package func colspan(
        _ value: ColSpan?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ColSpan.attribute, value?.description)
    }
}
