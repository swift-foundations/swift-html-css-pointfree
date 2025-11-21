///
/// Id.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the ID attribute for an HTML element
    @discardableResult
    public func id(
        _ id: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Id.attribute, id)
    }

    /// Sets the ID attribute using an Id struct
    @discardableResult
    public func id(
        _ id: Id?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Id.attribute, id?.description)
    }
}
