//
//  File.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the disableremoteplayback attribute on an element
    @discardableResult
    package func download(
        _ value: Download?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Download.attribute, value?.description)
    }
}
