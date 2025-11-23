//
//  LineHeight.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func lineHeight(
        _ lineHeight: W3C_CSS_Text.LineHeight?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(lineHeight, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func lineHeight<T: BinaryInteger>(
        _ lineHeight: T?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(
            lineHeight.map { LineHeight(integerLiteral: Int($0)) },
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @discardableResult
    public func lineHeight<T: BinaryFloatingPoint>(
        _ lineHeight: T?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(
            lineHeight.map { LineHeight(floatLiteral: Double($0)) },
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
