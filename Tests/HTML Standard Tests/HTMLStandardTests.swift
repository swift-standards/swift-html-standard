// HTML Standard Tests.swift
// HTML Standard Tests

import Testing

@testable import HTML_Standard

// MARK: - HTML (typealias for WHATWG_HTML)

extension HTML {
    @Suite
    struct Test {
        @Suite struct Unit {}
        @Suite struct EdgeCase {}
        @Suite struct Integration {}
        @Suite(.serialized) struct Performance {}
    }
}

// MARK: - Unit Tests

extension HTML.Test.Unit {

    // MARK: String Attributes

    @Test
    func `Id attribute name is id`() {
        #expect(HTML.Attribute.Id.attribute == "id")
    }

    @Test
    func `Id stores raw value from string literal`() {
        let id: HTML.Attribute.Id = "main-header"
        #expect(id.rawValue == "main-header")
    }

    @Test
    func `Id description matches rawValue`() {
        let id = HTML.Attribute.Id("section-1")
        #expect(id.description == "section-1")
    }

    @Test
    func `Class attribute name is class`() {
        #expect(HTML.Attribute.Class.attribute == "class")
    }

    @Test
    func `Class from string literal`() {
        let cls: HTML.Attribute.Class = "container"
        #expect(cls.rawValue == "container")
    }

    @Test
    func `Class from array literal joins with spaces`() {
        let cls: HTML.Attribute.Class = ["note", "editorial", "highlighted"]
        #expect(cls.rawValue == "note editorial highlighted")
    }

    @Test
    func `Lang attribute name is lang`() {
        #expect(HTML.Attribute.Lang.attribute == "lang")
    }

    @Test
    func `Lang common language constants`() {
        #expect(HTML.Attribute.Lang.english.rawValue == "en")
        #expect(HTML.Attribute.Lang.french.rawValue == "fr")
        #expect(HTML.Attribute.Lang.german.rawValue == "de")
        #expect(HTML.Attribute.Lang.japanese.rawValue == "ja")
        #expect(HTML.Attribute.Lang.arabic.rawValue == "ar")
    }

    @Test
    func `Lang regional variants`() {
        #expect(HTML.Attribute.Lang.americanEnglish.rawValue == "en-US")
        #expect(HTML.Attribute.Lang.britishEnglish.rawValue == "en-GB")
    }

    @Test
    func `Lang component init combines subtags`() {
        let lang = HTML.Attribute.Lang(language: "sr", script: "Cyrl", region: "RS")
        #expect(lang.rawValue == "sr-Cyrl-RS")
    }

    @Test
    func `Lang component init with only language`() {
        let lang = HTML.Attribute.Lang(language: "nl")
        #expect(lang.rawValue == "nl")
    }

    // MARK: Enumerated String Attributes

    @Test
    func `Dir attribute name is dir`() {
        #expect(HTML.Attribute.Dir.attribute == "dir")
    }

    @Test
    func `Dir has three direction values`() {
        #expect(HTML.Attribute.Dir.allCases.count == 3)
        #expect(HTML.Attribute.Dir.ltr.rawValue == "ltr")
        #expect(HTML.Attribute.Dir.rtl.rawValue == "rtl")
        #expect(HTML.Attribute.Dir.auto.rawValue == "auto")
    }

    @Test
    func `Hidden attribute name is hidden`() {
        #expect(HTML.Attribute.Hidden.attribute == "hidden")
    }

    @Test
    func `Hidden default init produces hidden state`() {
        let hidden = HTML.Attribute.Hidden()
        #expect(hidden.rawValue == "hidden")
    }

    @Test
    func `Hidden has three states`() {
        #expect(HTML.Attribute.Hidden.allCases.count == 3)
        #expect(HTML.Attribute.Hidden.empty.rawValue.isEmpty)
        #expect(HTML.Attribute.Hidden.hidden.rawValue == "hidden")
        #expect(HTML.Attribute.Hidden.untilFound.rawValue == "until-found")
    }

    @Test
    func `Draggable attribute name is draggable`() {
        #expect(HTML.Attribute.Draggable.attribute == "draggable")
    }

    @Test
    func `Draggable has three states`() {
        #expect(HTML.Attribute.Draggable.allCases.count == 3)
        #expect(HTML.Attribute.Draggable.true.rawValue == "true")
        #expect(HTML.Attribute.Draggable.false.rawValue == "false")
        #expect(HTML.Attribute.Draggable.auto.rawValue == "auto")
    }

    @Test
    func `Draggable from boolean literal`() {
        let draggable: HTML.Attribute.Draggable = true
        #expect(draggable == .true)

        let notDraggable: HTML.Attribute.Draggable = false
        #expect(notDraggable == .false)
    }

    @Test
    func `Contenteditable attribute name is contenteditable`() {
        #expect(HTML.Attribute.Contenteditable.attribute == "contenteditable")
    }

    @Test
    func `Contenteditable has four states`() {
        #expect(HTML.Attribute.Contenteditable.allCases.count == 4)
        #expect(HTML.Attribute.Contenteditable.true.rawValue == "true")
        #expect(HTML.Attribute.Contenteditable.empty.rawValue.isEmpty)
        #expect(HTML.Attribute.Contenteditable.false.rawValue == "false")
        #expect(HTML.Attribute.Contenteditable.plaintextOnly.rawValue == "plaintext-only")
    }

    @Test
    func `Contenteditable from boolean literal`() {
        let editable: HTML.Attribute.Contenteditable = true
        #expect(editable == .true)

        let notEditable: HTML.Attribute.Contenteditable = false
        #expect(notEditable == .false)
    }

    @Test
    func `Autocapitalize attribute name is autocapitalize`() {
        #expect(HTML.Attribute.Autocapitalize.attribute == "autocapitalize")
    }

    @Test
    func `Autocapitalize has six modes`() {
        #expect(HTML.Attribute.Autocapitalize.allCases.count == 6)
        #expect(HTML.Attribute.Autocapitalize.none.rawValue == "none")
        #expect(HTML.Attribute.Autocapitalize.off.rawValue == "off")
        #expect(HTML.Attribute.Autocapitalize.sentences.rawValue == "sentences")
        #expect(HTML.Attribute.Autocapitalize.on.rawValue == "on")
        #expect(HTML.Attribute.Autocapitalize.words.rawValue == "words")
        #expect(HTML.Attribute.Autocapitalize.characters.rawValue == "characters")
    }

    // MARK: Boolean Attributes

    @Test
    func `Autofocus attribute name is autofocus`() {
        #expect(HTML.Attribute.Autofocus.attribute == "autofocus")
    }

    @Test
    func `Autofocus default init is true`() {
        let autofocus = HTML.Attribute.Autofocus()
        #expect(autofocus.rawValue == true)
    }

    @Test
    func `Autofocus from boolean literal`() {
        let on: HTML.Attribute.Autofocus = true
        #expect(on.rawValue == true)

        let off: HTML.Attribute.Autofocus = false
        #expect(off.rawValue == false)
    }

    @Test
    func `Autofocus description reflects boolean state`() {
        #expect(HTML.Attribute.Autofocus(value: true).description == "true")
        #expect(HTML.Attribute.Autofocus(value: false).description == "false")
    }

    // MARK: Tabindex

    @Test
    func `Tabindex attribute name is tabindex`() {
        #expect(HTML.Attribute.Tabindex.attribute == "tabindex")
    }

    @Test
    func `Tabindex stores integer value`() {
        let tab = HTML.Attribute.Tabindex(5)
        #expect(tab.value == 5)
    }

    @Test
    func `Tabindex named constants`() {
        #expect(HTML.Attribute.Tabindex.notTabbable.value == -1)
        #expect(HTML.Attribute.Tabindex.inDocumentOrder.value == 0)
    }

    @Test
    func `Tabindex description is string of value`() {
        #expect(HTML.Attribute.Tabindex(3).description == "3")
    }
}

// MARK: - Edge Case Tests

extension HTML.Test.EdgeCase {

    @Test
    func `Id with empty string`() {
        let id: HTML.Attribute.Id = ""
        #expect(id.rawValue.isEmpty)
    }

    @Test
    func `Id with special characters`() {
        let id = HTML.Attribute.Id("my-id_123")
        #expect(id.rawValue == "my-id_123")
    }

    @Test
    func `Class from empty array literal`() {
        let cls: HTML.Attribute.Class = []
        #expect(cls.rawValue.isEmpty)
    }

    @Test
    func `Class from single element array literal`() {
        let cls: HTML.Attribute.Class = ["solo"]
        #expect(cls.rawValue == "solo")
    }

    @Test
    func `Lang component init skips nil script subtag`() {
        let lang = HTML.Attribute.Lang(language: "en", region: "US")
        #expect(lang.rawValue == "en-US")
    }

    @Test
    func `Lang component init skips nil region subtag`() {
        let lang = HTML.Attribute.Lang(language: "en", script: "Latn")
        #expect(lang.rawValue == "en-Latn")
    }

    @Test
    func `Tabindex with negative value`() {
        let tab = HTML.Attribute.Tabindex(-5)
        #expect(tab.value == -5)
        #expect(tab.description == "-5")
    }

    @Test
    func `Tabindex with maximum common value`() {
        let tab = HTML.Attribute.Tabindex(32767)
        #expect(tab.value == 32767)
    }

    @Test
    func `StringAttribute dynamicMemberLookup forwards to String`() {
        let id: HTML.Attribute.Id = "hello"
        #expect(id.isEmpty == false)
        #expect(id.count == 5)
    }

    @Test
    func `StringAttribute Equatable distinguishes values`() {
        let a: HTML.Attribute.Dir = .ltr
        let b: HTML.Attribute.Dir = .ltr
        let c: HTML.Attribute.Dir = .rtl
        #expect(a == b)
        #expect(a != c)
    }

    @Test
    func `StringAttribute Hashable deduplicates in Set`() {
        let set: Set<HTML.Attribute.Dir> = [.ltr, .rtl, .auto, .ltr]
        #expect(set.count == 3)
    }

    @Test
    func `BooleanAttribute allCases has two entries`() {
        #expect(HTML.Attribute.Autofocus.allCases.count == 2)
    }
}

// MARK: - Integration Tests

extension HTML.Test.Integration {

    @Test
    func `HTML Standard re-exports WHATWG_HTML elements`() {
        #expect(HTML.Element.Article.self == HTML.Element.Article.self)
        #expect(HTML.Element.Section.self == HTML.Element.Section.self)
        #expect(HTML.Element.Paragraph.self == HTML.Element.Paragraph.self)
        #expect(HTML.Element.Form.self == HTML.Element.Form.self)
    }

    @Test
    func `HTML Form resolves through the WHATWG_HTML nest alias`() {
        #expect(HTML.Element.Form.self == WHATWG_HTML.Element.Form.self)
    }

    @Test
    func `HTML Standard re-exports geometry via GeometryConversion namespace`() {
        #expect(GeometryConversion.self == GeometryConversion.self)
    }

    @Test
    func `Multiple attribute types coexist without ambiguity`() {
        let id: HTML.Attribute.Id = "test"
        let cls: HTML.Attribute.Class = "container"
        let lang: HTML.Attribute.Lang = .english
        let dir: HTML.Attribute.Dir = .ltr
        let hidden = HTML.Attribute.Hidden()
        let tabindex = HTML.Attribute.Tabindex(0)

        #expect(id.rawValue == "test")
        #expect(cls.rawValue == "container")
        #expect(lang.rawValue == "en")
        #expect(dir.rawValue == "ltr")
        #expect(hidden.rawValue == "hidden")
        #expect(tabindex.value == 0)
    }
}
