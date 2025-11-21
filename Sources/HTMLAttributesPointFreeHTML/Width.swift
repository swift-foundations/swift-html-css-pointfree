///
/// Width.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 04/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the width attribute on an element
    @discardableResult
    package func width(
        _ value: Width?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Width.attribute, value?.description)
    }
}
