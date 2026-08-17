// HTML Standard Performance Tests.swift
// HTML Standard Performance Tests

import HTML_Standard
import Testing

extension HTML.Test.Performance {

    @Test(.timed(iterations: 100, warmup: 10))
    func `StringAttribute creation from string literal`() {
        for _ in 0..<1000 {
            let _: HTML.Attribute.Id = "performance-test-id"
            let _: HTML.Attribute.Class = "container main-content"
            let _: HTML.Attribute.Lang = "en-US"
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Class creation from array literal`() {
        for _ in 0..<1000 {
            let _: HTML.Attribute.Class = ["nav", "primary", "sticky", "dark-theme"]
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `BooleanAttribute creation`() {
        for _ in 0..<1000 {
            let _: HTML.Attribute.Autofocus = true
            let _: HTML.Attribute.Autofocus = false
            let _ = HTML.Attribute.Autofocus()
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Enumerated attribute static member access`() {
        for _ in 0..<1000 {
            let _ = HTML.Attribute.Dir.ltr
            let _ = HTML.Attribute.Dir.rtl
            let _ = HTML.Attribute.Dir.auto
            let _ = HTML.Attribute.Hidden.hidden
            let _ = HTML.Attribute.Hidden.untilFound
            let _ = HTML.Attribute.Draggable.true
            let _ = HTML.Attribute.Contenteditable.plaintextOnly
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Lang component init with subtags`() {
        for _ in 0..<1000 {
            let _ = HTML.Attribute.Lang(language: "zh", script: "Hans", region: "CN")
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Tabindex creation and description`() {
        for i in 0..<1000 {
            let tab = HTML.Attribute.Tabindex(i)
            _ = tab.description
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `CaseIterable enumeration`() {
        for _ in 0..<1000 {
            for dir in HTML.Attribute.Dir.allCases {
                _ = dir.rawValue
            }
            for hidden in HTML.Attribute.Hidden.allCases {
                _ = hidden.rawValue
            }
            for autocap in HTML.Attribute.Autocapitalize.allCases {
                _ = autocap.rawValue
            }
        }
    }
}
