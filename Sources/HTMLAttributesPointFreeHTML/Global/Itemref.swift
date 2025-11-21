///
/// Itemref.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the itemref attribute with a single element ID
    @discardableResult
    public func itemref(
        _ id: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemref.attribute, id)
    }

    /// Sets the itemref attribute with multiple element IDs
    @discardableResult
    public func itemref(
        _ ids: [String]
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemref.attribute, ids.joined(separator: " "))
    }

    /// Sets the itemref attribute with multiple element IDs as variadic parameters
    @discardableResult
    public func itemref(
        _ ids: String...
    ) -> _HTMLAttributes<Self> {
        self.itemref(ids)
    }

    /// Sets the itemref attribute using an Itemref struct
    @discardableResult
    public func itemref(
        _ attribute: Itemref
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemref.attribute, attribute.description)
    }
}
