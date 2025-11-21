//
//  PopoverTarget.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the popovertarget attribute on an element
    @discardableResult
    package func popoverTarget(
        _ value: PopoverTarget?
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTarget.attribute, value?.description)
    }
}
