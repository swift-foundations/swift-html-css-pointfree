///
/// Disabled.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Adds the disabled attribute to the element
    package var disabled: _HTMLAttributes<Self> {
        self.attribute(Disabled.attribute)
    }

    /// Conditionally adds the disabled attribute to the element
    @HTMLBuilder
    package func disabled(_ value: Disabled?) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
