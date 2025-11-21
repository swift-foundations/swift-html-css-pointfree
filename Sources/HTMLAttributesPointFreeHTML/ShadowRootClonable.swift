//
//  ShadowRootClonable.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the shadowrootclonable attribute on an element
    @discardableResult
    package func shadowRootClonable(
        _ value: ShadowRootClonable?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ShadowRootClonable.attribute, value?.description)
    }
}
