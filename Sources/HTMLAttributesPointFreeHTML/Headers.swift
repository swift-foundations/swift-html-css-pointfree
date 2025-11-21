//
//  Headers.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the headers attribute on an element
    @discardableResult
    package func headers(
        _ value: Headers?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Headers.attribute, value?.description)
    }
}
