//
//  Start.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the start attribute on an element
    @discardableResult
    package func start(
        _ value: Start?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Start.attribute, value?.description)
    }
}
