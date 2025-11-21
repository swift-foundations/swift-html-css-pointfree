///
/// Popover.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the popover attribute as a boolean (equivalent to popover="auto")
    @discardableResult
    public func popover() -> _HTMLAttributes<Self> {
        self.attribute(Popover.attribute, "")
    }

    /// Sets the popover attribute with a specific type
    @discardableResult
    public func popover(
        _ type: Popover
    ) -> _HTMLAttributes<Self> {
        self.attribute(Popover.attribute, type.description)
    }

    /// Sets the popover attribute with a value
    @discardableResult
    public func popover(
        _ value: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Popover.attribute, value)
    }
}

extension HTML {
    /// Sets the popovertarget attribute with the ID of the target popover
    @discardableResult
    public func popovertarget(
        _ id: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTarget.attribute, id)
    }

    /// Sets the popovertarget attribute using a PopoverTarget struct
    @discardableResult
    public func popovertarget(
        _ attribute: PopoverTarget?
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTarget.attribute, attribute?.description)
    }
}

extension HTML {
    /// Sets the popovertargetaction attribute with an action
    @discardableResult
    public func popovertargetaction(
        _ action: PopoverTargetAction?
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTargetAction.attribute, action?.description)
    }
}
