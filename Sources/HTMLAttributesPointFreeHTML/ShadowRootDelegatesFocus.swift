//
//  ShadowRootDelegatesFocus.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the shadowrootdelegatesfocus attribute on an element
    @discardableResult
    package func shadowRootDelegatesFocus(
        _ value: ShadowRootDelegatesFocus?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ShadowRootDelegatesFocus.attribute, value?.description)
    }
}
