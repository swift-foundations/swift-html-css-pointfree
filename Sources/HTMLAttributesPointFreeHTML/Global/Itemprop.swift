///
/// Itemprop.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the itemprop attribute with a property name
    @discardableResult
    public func itemprop(
        _ propertyName: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemprop.attribute, propertyName)
    }

    /// Sets the itemprop attribute with multiple property names
    @discardableResult
    public func itemprop(
        _ propertyNames: [String]
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemprop.attribute, propertyNames.joined(separator: " "))
    }

    /// Sets the itemprop attribute with multiple property names as variadic parameters
    @discardableResult
    public func itemprop(
        _ propertyNames: String...
    ) -> _HTMLAttributes<Self> {
        self.itemprop(propertyNames)
    }

    /// Sets the itemprop attribute using an Itemprop struct
    @discardableResult
    public func itemprop(
        _ attribute: Itemprop
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemprop.attribute, attribute.description)
    }
}
