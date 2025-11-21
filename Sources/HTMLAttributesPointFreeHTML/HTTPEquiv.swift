//
//  Headers.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the httpEquiv attribute on an element
    @discardableResult
    package func httpEquiv(
        _ value: HttpEquiv?
    ) -> _HTMLAttributes<Self> {
        self.attribute("http-equiv", value?.description)
    }
}
