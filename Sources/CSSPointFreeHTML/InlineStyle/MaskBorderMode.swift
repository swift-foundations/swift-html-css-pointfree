//
//  MaskBorderMode.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func maskBorderMode(
        _ maskBorderMode: W3C_CSS_Masking.MaskBorderMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(maskBorderMode, media: media, selector: selector, pseudo: pseudo)
    }
}
