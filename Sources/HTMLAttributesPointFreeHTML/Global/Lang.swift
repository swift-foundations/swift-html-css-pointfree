///
/// Lang.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the lang attribute with a language tag
    @discardableResult
    public func lang(
        _ language: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Lang.attribute, language)
    }

    /// Sets the lang attribute with separate components
    @discardableResult
    public func lang(
        language: String,
        script: String? = nil,
        region: String? = nil
    ) -> _HTMLAttributes<Self> {
        self.lang(Lang(language: language, script: script, region: region))
    }

    /// Sets the lang attribute using a Lang struct
    @discardableResult
    public func lang(
        _ attribute: Lang
    ) -> _HTMLAttributes<Self> {
        self.attribute(Lang.attribute, attribute.description)
    }
}
