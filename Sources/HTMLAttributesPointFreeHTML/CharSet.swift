//
//  CharSet.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the charset attribute on an element
    @discardableResult
    package func charset(
        _ value: CharSet?
    ) -> _HTMLAttributes<Self> {
        self.attribute("charset", value?.description)
    }
}
