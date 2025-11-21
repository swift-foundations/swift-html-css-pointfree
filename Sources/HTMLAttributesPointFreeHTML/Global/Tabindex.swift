///
/// Tabindex.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the tabindex attribute with an integer value
    @discardableResult
    public func tabindex(
        _ value: Int
    ) -> _HTMLAttributes<Self> {
        self.attribute(Tabindex.attribute, String(value))
    }

    /// Sets the tabindex attribute using a Tabindex struct
    @discardableResult
    public func tabindex(
        _ attribute: Tabindex
    ) -> _HTMLAttributes<Self> {
        self.attribute(Tabindex.attribute, attribute.description)
    }

    /// Makes the element not focusable via keyboard but focusable programmatically
    @discardableResult
    public func notTabbable() -> _HTMLAttributes<Self> {
        self.tabindex(Tabindex.notTabbable)
    }

    /// Makes the element focusable in the natural document order
    @discardableResult
    public func tabbableInDocumentOrder() -> _HTMLAttributes<Self> {
        self.tabindex(Tabindex.inDocumentOrder)
    }
}
