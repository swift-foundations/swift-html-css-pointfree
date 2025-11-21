//
//  Span.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the span attribute on an element
    @discardableResult
    package func span(
        _ value: Span?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Span.attribute, value?.description)
    }
}
