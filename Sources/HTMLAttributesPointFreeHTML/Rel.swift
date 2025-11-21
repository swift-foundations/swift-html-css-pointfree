///
/// Rel.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the rel attribute on an element
    @discardableResult
    package func rel(
        _ value: Rel?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Rel.attribute, value?.description)
    }
}

// extension HTML {
//    /// Sets the rel attribute with multiple link type values
//    @discardableResult
//    package func rel(
//        _ values: Rel.LinkType...
//    ) -> _HTMLAttributes<Self> {
//        self.rel(Rel(values))
//    }
// }
