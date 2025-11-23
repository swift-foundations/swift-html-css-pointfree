//
//  StrokeMiterlimit.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func strokeMiterlimit(
        _ strokeMiterlimit: W3C_CSS_Images.StrokeMiterlimit?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(strokeMiterlimit, media: media, selector: selector, pseudo: pseudo)
    }
}
