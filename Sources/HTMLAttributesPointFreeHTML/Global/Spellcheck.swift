///
/// Spellcheck.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the spellcheck attribute using a Spellcheck enum value
    @discardableResult
    package func spellcheck(
        _ attribute: Spellcheck?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Spellcheck.attribute, attribute?.description)
    }
}
