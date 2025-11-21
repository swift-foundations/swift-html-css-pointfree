///
/// Checked.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 04/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Adds the checked attribute to the element
    package var checked: _HTMLAttributes<Self> {
        self.attribute(Checked.attribute)
    }

    /// Conditionally adds the checked attribute to the element
    @HTMLBuilder
    package func checked(_ value: Checked?) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
