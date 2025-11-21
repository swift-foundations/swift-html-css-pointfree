///
/// Elementtiming.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    @discardableResult
    package func elementtiming(
        _ value: Elementtiming?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Elementtiming.attribute, value?.description)
    }

    /// Adds element timing with a categorized identifier
    @discardableResult
    package func elementtiming(
        category: Elementtiming.Category,
        name: String,
        separator: String = "-"
    ) -> _HTMLAttributes<Self> {
        self.elementtiming(Elementtiming(category: category, name: name, separator: separator))
    }
}
