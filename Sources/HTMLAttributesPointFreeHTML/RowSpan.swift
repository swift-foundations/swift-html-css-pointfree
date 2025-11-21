//
//  RowSpan.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the rowspan attribute on an element
    @discardableResult
    package func rowspan(
        _ value: RowSpan?
    ) -> _HTMLAttributes<Self> {
        self.attribute(RowSpan.attribute, value?.description)
    }
}
