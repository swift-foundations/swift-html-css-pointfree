///
/// Itemscope.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the itemscope attribute, creating a new microdata item
    public var itemscope: _HTMLAttributes<Self> {
        self.attribute(Itemscope.attribute)
    }

    /// Sets the itemscope attribute using an Itemscope enum value
    @discardableResult
    public func itemscope(
        _ value: Itemscope?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
