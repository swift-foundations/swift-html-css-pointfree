///
/// Inert.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the inert attribute, making the element and all its descendants non-interactive
    public var inert: _HTMLAttributes<Self> {
        self.attribute(Inert.attribute)
    }

    /// Conditionally adds the disabled attribute to the element
    @HTMLBuilder
    package func inert(_ value: Inert?) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
