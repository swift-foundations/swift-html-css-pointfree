///
/// Is.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the is attribute to extend a standard HTML element with custom behavior
    @discardableResult
    public func `is`(
        _ value: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Is.attribute, Is(value).description)
    }

    /// Sets the is attribute using an Is struct
    @discardableResult
    public func `is`(
        _ value: Is
    ) -> _HTMLAttributes<Self> {
        self.attribute(Is.attribute, value.description)
    }
}
