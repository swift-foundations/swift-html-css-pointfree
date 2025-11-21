///
/// Virtualkeyboardpolicy.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the virtualkeyboardpolicy attribute with a policy value
    @discardableResult
    public func virtualkeyboardpolicy(
        _ policy: Virtualkeyboardpolicy
    ) -> _HTMLAttributes<Self> {
        self.attribute(Virtualkeyboardpolicy.attribute, policy.description)
    }

    /// Sets the virtualkeyboardpolicy attribute to auto
    @discardableResult
    public func autoKeyboard() -> _HTMLAttributes<Self> {
        self.virtualkeyboardpolicy(.auto)
    }

    /// Sets the virtualkeyboardpolicy attribute to manual
    @discardableResult
    public func manualKeyboard() -> _HTMLAttributes<Self> {
        self.virtualkeyboardpolicy(.manual)
    }
}
