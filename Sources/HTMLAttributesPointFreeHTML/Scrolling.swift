//
//  Scope.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the scope attribute on an element
    @discardableResult
    package func scrolling(
        _ value: Scrolling?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Scrolling.attribute, value?.rawValue)
    }
}
