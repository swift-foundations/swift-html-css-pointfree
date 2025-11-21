///
/// Multiple.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Adds the multiple attribute to the element
    package var multiple: _HTMLAttributes<Self> {
        self.attribute(Multiple.attribute)
    }

    /// Conditionally adds the multiple attribute to the element
    @HTMLBuilder
    package func multiple(_ value: Multiple?) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
