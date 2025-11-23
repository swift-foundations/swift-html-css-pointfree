//
//  WebkitTextStroke.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func webkitTextStroke(
        _ webkitTextStroke: W3C_CSS_UI.WebkitTextStroke?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(webkitTextStroke, media: media, selector: selector, pseudo: pseudo)
    }
}
