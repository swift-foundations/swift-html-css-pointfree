//
//  Loading.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the loading attribute on an element
    @discardableResult
    package func loading(
        _ value: Loading?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Loading.attribute, value?.rawValue)
    }
}
