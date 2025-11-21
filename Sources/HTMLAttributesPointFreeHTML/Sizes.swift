//
//  Sizes.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the sizes attribute on an element
    @discardableResult
    package func sizes(
        _ value: Sizes?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Sizes.attribute, value?.description)
    }
}
