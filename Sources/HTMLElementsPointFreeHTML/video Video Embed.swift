//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements

extension HTML_Standard_Elements.Video {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .src(self.src)
            .controls(self.controls)
            .autoplay(self.autoplay)
            .poster(self.poster)
            .loop(self.loop)
            .muted(self.muted)
            .width(self.width)
            .height(self.height)
            .preload(self.preload)
            .playsinline(self.playsinline)
            .crossorigin(self.crossorigin)
            .controlsList(self.controlslist)
            .disablePictureInPicture(self.disablepictureinpicture)
            .disableRemotePlayback(self.disableremoteplayback)
    }
}
