///
/// Title.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the title attribute with text
    @discardableResult
    public func title(
        _ value: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Title.attribute, value)
    }

    /// Sets the title attribute with multiline text
    @discardableResult
    public func title(
        lines: [String]
    ) -> _HTMLAttributes<Self> {
        self.attribute(Title.attribute, lines.joined(separator: "\n"))
    }

    /// Sets the title attribute with multiline text as variadic parameters
    @discardableResult
    public func title(
        lines: String...
    ) -> _HTMLAttributes<Self> {
        self.title(lines: lines)
    }

    /// Sets the title attribute using a Title struct
    @discardableResult
    public func title(
        _ attribute: Title?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Title.attribute, attribute?.description)
    }

    /// Sets an empty title to prevent inheriting from ancestors
    @discardableResult
    public func noTitle() -> _HTMLAttributes<Self> {
        self.title(Title.empty)
    }
}
