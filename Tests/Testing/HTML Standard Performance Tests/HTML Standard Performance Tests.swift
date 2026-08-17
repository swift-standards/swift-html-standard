// HTML Standard Performance Tests.swift
// HTML Standard Performance Tests

import HTML_Standard
import Testing

extension HTML.Test.Performance {

    @Test(.timed(iterations: 100, warmup: 10))
    func `StringAttribute creation from string literal`() {
        for _ in 0..<1000 {
            let _: HTML.Id.Attribute = "performance-test-id"
            let _: HTML.Class.Attribute = "container main-content"
            let _: HTML.Lang.Attribute = "en-US"
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Class creation from array literal`() {
        for _ in 0..<1000 {
            let _: HTML.Class.Attribute = ["nav", "primary", "sticky", "dark-theme"]
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `BooleanAttribute creation`() {
        for _ in 0..<1000 {
            let _: HTML.Autofocus.Attribute = true
            let _: HTML.Autofocus.Attribute = false
            let _ = HTML.Autofocus.Attribute()
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Enumerated attribute static member access`() {
        for _ in 0..<1000 {
            let _ = HTML.Dir.Attribute.ltr
            let _ = HTML.Dir.Attribute.rtl
            let _ = HTML.Dir.Attribute.auto
            let _ = HTML.Hidden.Attribute.hidden
            let _ = HTML.Hidden.Attribute.untilFound
            let _ = HTML.Draggable.Attribute.true
            let _ = HTML.Contenteditable.Attribute.plaintextOnly
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Lang component init with subtags`() {
        for _ in 0..<1000 {
            let _ = HTML.Lang.Attribute(language: "zh", script: "Hans", region: "CN")
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Tabindex creation and description`() {
        for i in 0..<1000 {
            let tab = HTML.Tabindex.Attribute(i)
            _ = tab.description
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `CaseIterable enumeration`() {
        for _ in 0..<1000 {
            for dir in HTML.Dir.Attribute.allCases {
                _ = dir.rawValue
            }
            for hidden in HTML.Hidden.Attribute.allCases {
                _ = hidden.rawValue
            }
            for autocap in HTML.Autocapitalize.Attribute.allCases {
                _ = autocap.rawValue
            }
        }
    }
}
