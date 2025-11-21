//
//  Playsinline.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the playsinline attribute on an element
    @discardableResult
    package func playsinline(
        _ value: Playsinline?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Playsinline.attribute, value?.description)
    }
}
