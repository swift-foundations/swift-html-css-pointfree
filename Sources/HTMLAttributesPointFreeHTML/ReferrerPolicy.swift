//
//  ReferrerPolicy.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the referrerpolicy attribute on an element
    @discardableResult
    package func referrerPolicy(
        _ value: ReferrerPolicy?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ReferrerPolicy.attribute, value?.description)
    }
}
