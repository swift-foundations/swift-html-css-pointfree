//
//  File 3.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the xmlns attribute on an element
    @discardableResult
    package func xmlns(
        _ value: Xmlns?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Xmlns.attribute, value?.description)
    }
}
