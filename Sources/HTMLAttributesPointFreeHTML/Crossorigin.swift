///
/// Crossorigin.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    @discardableResult
    package func crossorigin(
        _ value: Crossorigin?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Crossorigin.attribute, value?.description)
    }

    //    @discardableResult
    //    package func crossorigin(
    //        _ policy: CrosPolicy
    //    ) -> _HTMLAttributes<Self> {
    //        self.crossorigin(Crossorigin(policy))
    //    }
}
