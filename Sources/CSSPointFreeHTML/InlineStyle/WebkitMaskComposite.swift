//
//  WebkitMaskComposite.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func webkitMaskComposite(
        _ webkitMaskComposite: W3C_CSS_UI.WebkitMaskComposite?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(webkitMaskComposite, media: media, selector: selector, pseudo: pseudo)
    }
}
