// HTML Standard Snapshot Tests.swift
// HTML Standard Snapshot Tests

import HTML_Standard
import Testing

@Suite(.serialized)
struct HTMLStandardSnapshotTests {

    @Test
    func `Dir allCases descriptions`() {
        let descriptions = Dir.allCases.map(\.description)
        #snapshot(descriptions.joined(separator: "\n"), as: .lines)
    }

    @Test
    func `Hidden allCases descriptions`() {
        let descriptions = Hidden.allCases.map(\.description)
        #snapshot(descriptions.joined(separator: "\n"), as: .lines)
    }

    @Test
    func `Draggable allCases descriptions`() {
        let descriptions = Draggable.allCases.map(\.description)
        #snapshot(descriptions.joined(separator: "\n"), as: .lines)
    }

    @Test
    func `Contenteditable allCases descriptions`() {
        let descriptions = Contenteditable.allCases.map(\.description)
        #snapshot(descriptions.joined(separator: "\n"), as: .lines)
    }

    @Test
    func `Autocapitalize allCases descriptions`() {
        let descriptions = Autocapitalize.allCases.map(\.description)
        #snapshot(descriptions.joined(separator: "\n"), as: .lines)
    }

    @Test
    func `Lang common constants descriptions`() {
        let langs: [Lang] = [
            .english, .french, .german, .spanish, .italian,
            .japanese, .chinese, .russian, .arabic,
            .americanEnglish, .britishEnglish,
        ]
        let descriptions = langs.map(\.description)
        #snapshot(descriptions.joined(separator: "\n"), as: .lines)
    }

    @Test
    func `Autofocus allCases descriptions`() {
        let descriptions = Autofocus.allCases.map(\.description)
        #snapshot(descriptions.joined(separator: "\n"), as: .lines)
    }
}
