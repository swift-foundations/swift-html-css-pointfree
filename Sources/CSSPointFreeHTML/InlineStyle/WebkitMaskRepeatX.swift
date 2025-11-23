//
//  WebkitMaskRepeatX.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func webkitMaskRepeatX(
        _ webkitMaskRepeatX: W3C_CSS_UI.WebkitMaskRepeatX?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(webkitMaskRepeatX, media: media, selector: selector, pseudo: pseudo)
    }
}
