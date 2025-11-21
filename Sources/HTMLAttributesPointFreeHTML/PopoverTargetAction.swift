//
//  PopoverTargetAction.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the popovertargetaction attribute on an element
    @discardableResult
    package func popoverTargetAction(
        _ value: PopoverTargetAction?
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTargetAction.attribute, value?.description)
    }
}
