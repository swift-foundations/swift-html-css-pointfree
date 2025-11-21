//
//  Blocking.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the blocking attribute on an element
    @discardableResult
    package func blocking(
        _ value: Blocking?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Blocking.attribute, value?.description)
    }
}
