//
//  Transform.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func transform(
        _ transform: W3C_CSS_Transforms.Transform?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(transform, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func transform(
        _ transform: String,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(
            Transform.property,
            transform,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
