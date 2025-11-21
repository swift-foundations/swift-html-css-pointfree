//
//  NoResize.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the noresize attribute on an element
    @discardableResult
    package func noResize(
        _ value: NoResize?
    ) -> _HTMLAttributes<Self> {
        self.attribute(NoResize.attribute, value?.description)
    }
}
