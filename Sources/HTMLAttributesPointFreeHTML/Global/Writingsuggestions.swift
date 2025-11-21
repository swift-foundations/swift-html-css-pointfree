///
/// Writingsuggestions.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the writingsuggestions attribute with a boolean value
    @discardableResult
    public func writingsuggestions(
        _ enabled: Bool
    ) -> _HTMLAttributes<Self> {
        self.attribute(Writingsuggestions.attribute, enabled ? "true" : "false")
    }

    /// Sets the writingsuggestions attribute using a Writingsuggestions enum value
    @discardableResult
    public func writingsuggestions(
        _ attribute: Writingsuggestions
    ) -> _HTMLAttributes<Self> {
        self.attribute(Writingsuggestions.attribute, attribute.description)
    }

    /// Enables browser-provided writing suggestions
    @discardableResult
    public func enableWritingSuggestions() -> _HTMLAttributes<Self> {
        self.writingsuggestions(Writingsuggestions.true)
    }

    /// Disables browser-provided writing suggestions
    @discardableResult
    public func disableWritingSuggestions() -> _HTMLAttributes<Self> {
        self.writingsuggestions(Writingsuggestions.false)
    }
}
