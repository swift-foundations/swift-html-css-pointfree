//
//  Media.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the media attribute on an element
    @discardableResult
    package func media(
        _ value: Media?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Media.attribute, value?.description)
    }
}
