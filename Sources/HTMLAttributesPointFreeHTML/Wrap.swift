//
//  Wrap.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the wrap attribute on an element
    @discardableResult
    package func wrap(
        _ value: TextareaWrap?
    ) -> _HTMLAttributes<Self> {
        self.attribute(TextareaWrap.attribute, value?.description)
    }
}
