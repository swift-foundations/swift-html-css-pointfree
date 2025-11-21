//
//  Optimum.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the optimum attribute on an element
    @discardableResult
    package func optimum(
        _ value: Optimum?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Optimum.attribute, value?.description)
    }
}
