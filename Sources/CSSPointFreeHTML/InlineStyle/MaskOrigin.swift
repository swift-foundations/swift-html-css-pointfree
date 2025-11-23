//
//  MaskOrigin.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func maskOrigin(
        _ maskOrigin: W3C_CSS_Masking.MaskOrigin?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(maskOrigin, media: media, selector: selector, pseudo: pseudo)
    }
}
