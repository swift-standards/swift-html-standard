// HTML Standard Performance Tests.swift
// HTML Standard Performance Tests

import HTML_Standard
import Testing

@Suite(.serialized)
struct HTMLStandardPerformanceTests {

    @Test(.timed(iterations: 100, warmup: 10))
    func `StringAttribute creation from string literal`() {
        for _ in 0..<1000 {
            let _: Id = "performance-test-id"
            let _: Class = "container main-content"
            let _: Lang = "en-US"
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Class creation from array literal`() {
        for _ in 0..<1000 {
            let _: Class = ["nav", "primary", "sticky", "dark-theme"]
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `BooleanAttribute creation`() {
        for _ in 0..<1000 {
            let _: Autofocus = true
            let _: Autofocus = false
            let _ = Autofocus()
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Enumerated attribute static member access`() {
        for _ in 0..<1000 {
            let _ = Dir.ltr
            let _ = Dir.rtl
            let _ = Dir.auto
            let _ = Hidden.hidden
            let _ = Hidden.untilFound
            let _ = Draggable.true
            let _ = Contenteditable.plaintextOnly
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Lang component init with subtags`() {
        for _ in 0..<1000 {
            let _ = Lang(language: "zh", script: "Hans", region: "CN")
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Tabindex creation and description`() {
        for i in 0..<1000 {
            let tab = Tabindex(i)
            _ = tab.description
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `CaseIterable enumeration`() {
        for _ in 0..<1000 {
            for dir in Dir.allCases {
                _ = dir.rawValue
            }
            for hidden in Hidden.allCases {
                _ = hidden.rawValue
            }
            for autocap in Autocapitalize.allCases {
                _ = autocap.rawValue
            }
        }
    }
}
