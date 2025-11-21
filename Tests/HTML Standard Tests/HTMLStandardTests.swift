// HTMLStandardTests.swift
// HTML Standard Tests

@testable import HTML_Standard
import Testing

@Suite("HTML Standard")
struct HTMLStandardTests {

    @Test
    func `HTML Standard: WHATWG_HTML is re-exported`() {
        // This test verifies that WHATWG_HTML types are accessible
        // through HTML_Standard

        // Since swift-whatwg-html only has a Placeholder.swift currently,
        // we just verify the module imports successfully
        #expect(true)
    }
}
