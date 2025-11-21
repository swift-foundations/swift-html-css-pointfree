//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements

extension HTML_Standard_Elements.Audio {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .src(self.src)
            .controls(self.controls)
            .autoplay(self.autoplay)
            .loop(self.loop)
            .muted(self.muted)
            //            .preload(self.preload)
            .crossorigin(self.crossorigin)
            //            .controlslist(self.controlslist)
            .disableRemotePlayback(self.disableremoteplayback)
    }
}
