//
//  FontLanguageOverride.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func fontLanguageOverride(
        _ fontLanguageOverride: W3C_CSS_Fonts.FontLanguageOverride?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(fontLanguageOverride, media: media, selector: selector, pseudo: pseudo)
    }
}
