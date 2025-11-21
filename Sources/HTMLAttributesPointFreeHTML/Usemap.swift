//
//  File 2.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the usemap attribute on an element
    @discardableResult
    package func usemap(
        _ value: Usemap?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Usemap.attribute, value?.description)
    }
}
