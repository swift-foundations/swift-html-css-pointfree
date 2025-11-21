//
//  ShadowRootMode.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the shadowrootmode attribute on an element
    @discardableResult
    package func shadowRootMode(
        _ value: ShadowRootMode?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ShadowRootMode.attribute, value?.description)
    }
}
