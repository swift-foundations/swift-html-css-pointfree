///
/// Contenteditable.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    @discardableResult
    public func contenteditable(
        _ value: Contenteditable
    ) -> _HTMLAttributes<Self> {
        self.attribute(Contenteditable.attribute, value.description)
    }

    public var contenteditable: _HTMLAttributes<Self> {
        self.contenteditable(.true)
    }
}
