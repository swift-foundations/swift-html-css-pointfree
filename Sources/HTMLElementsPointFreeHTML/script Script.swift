//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import HTMLAttributesPointFreeHTML
import PointFreeHTML

extension HTML_Standard_Elements.Script {
    public func callAsFunction(
        _ script: () -> String = { "" }
    ) -> some PointFreeHTML.HTML {

        let script = script()
        var escaped = ""
        escaped.unicodeScalars.reserveCapacity(script.unicodeScalars.count)

        for index in script.unicodeScalars.indices {
            let scalar = script.unicodeScalars[index]
            if scalar == "<",
                script.unicodeScalars[index...].starts(with: "<!--".unicodeScalars)
                    || script.unicodeScalars[index...].starts(with: "<script".unicodeScalars)
                    || script.unicodeScalars[index...].starts(with: "</script".unicodeScalars) {
                escaped.unicodeScalars.append(contentsOf: #"\x3C"#.unicodeScalars)
            } else {
                escaped.unicodeScalars.append(scalar)
            }
        }

        return HTMLElement(tag: Self.tag) {
            if script.isEmpty { HTMLEmpty() } else { HTMLRaw(escaped) }
        }
        .src(self.src)
        .`async`(self.`async`)
        .`defer`(self.`defer`)
        .type(self.type)
        .integrity(self.integrity)
        .referrerPolicy(self.referrerpolicy)
        .nomodule(self.nomodule)
        .fetchPriority(self.fetchpriority)
        .blocking(self.blocking)
        .crossorigin(self.crossorigin)
        .nonce(self.nonce)
        .attributionSrc(self.attributionsrc)
    }
}

extension HTML_Standard_Elements.Script: @retroactive PointFreeHTML.HTML {
    public var body: some PointFreeHTML.HTML {
        Script(
            src: self.src,
            async: self.async,
            defer: self.defer,
            type: self.type,
            integrity: self.integrity,
            referrerpolicy: self.referrerpolicy,
            nomodule: self.nomodule,
            fetchpriority: self.fetchpriority,
            blocking: self.blocking,
            crossorigin: self.crossorigin,
            nonce: self.nonce,
            attributionsrc: self.attributionsrc
        ).callAsFunction {
            ""
        }
    }
}
