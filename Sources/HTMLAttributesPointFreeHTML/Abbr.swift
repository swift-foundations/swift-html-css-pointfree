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
    package func abbr(
        _ value: Abbr?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Abbr.attribute, value?.description)
    }
}
