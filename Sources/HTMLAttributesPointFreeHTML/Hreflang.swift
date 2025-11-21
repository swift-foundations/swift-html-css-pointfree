//
//  Hreflang.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the hreflang attribute on an element
    @discardableResult
    package func hreflang(
        _ value: Hreflang?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Hreflang.attribute, value?.description)
    }
}
