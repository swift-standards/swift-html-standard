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
        #expect(Id.attribute == "id")
    }

    @Test
    func `Id stores raw value from string literal`() {
        let id: Id = "main-header"
        #expect(id.rawValue == "main-header")
    }

    @Test
    func `Id description matches rawValue`() {
        let id = Id("section-1")
        #expect(id.description == "section-1")
    }

    @Test
    func `Class attribute name is class`() {
        #expect(Class.attribute == "class")
    }

    @Test
    func `Class from string literal`() {
        let cls: Class = "container"
        #expect(cls.rawValue == "container")
    }

    @Test
    func `Class from array literal joins with spaces`() {
        let cls: Class = ["note", "editorial", "highlighted"]
        #expect(cls.rawValue == "note editorial highlighted")
    }

    @Test
    func `Lang attribute name is lang`() {
        #expect(Lang.attribute == "lang")
    }

    @Test
    func `Lang common language constants`() {
        #expect(Lang.english.rawValue == "en")
        #expect(Lang.french.rawValue == "fr")
        #expect(Lang.german.rawValue == "de")
        #expect(Lang.japanese.rawValue == "ja")
        #expect(Lang.arabic.rawValue == "ar")
    }

    @Test
    func `Lang regional variants`() {
        #expect(Lang.americanEnglish.rawValue == "en-US")
        #expect(Lang.britishEnglish.rawValue == "en-GB")
    }

    @Test
    func `Lang component init combines subtags`() {
        let lang = Lang(language: "sr", script: "Cyrl", region: "RS")
        #expect(lang.rawValue == "sr-Cyrl-RS")
    }

    @Test
    func `Lang component init with only language`() {
        let lang = Lang(language: "nl")
        #expect(lang.rawValue == "nl")
    }

    // MARK: Enumerated String Attributes

    @Test
    func `Dir attribute name is dir`() {
        #expect(Dir.attribute == "dir")
    }

    @Test
    func `Dir has three direction values`() {
        #expect(Dir.allCases.count == 3)
        #expect(Dir.ltr.rawValue == "ltr")
        #expect(Dir.rtl.rawValue == "rtl")
        #expect(Dir.auto.rawValue == "auto")
    }

    @Test
    func `Hidden attribute name is hidden`() {
        #expect(Hidden.attribute == "hidden")
    }

    @Test
    func `Hidden default init produces hidden state`() {
        let hidden = Hidden()
        #expect(hidden.rawValue == "hidden")
    }

    @Test
    func `Hidden has three states`() {
        #expect(Hidden.allCases.count == 3)
        #expect(Hidden.empty.rawValue.isEmpty)
        #expect(Hidden.hidden.rawValue == "hidden")
        #expect(Hidden.untilFound.rawValue == "until-found")
    }

    @Test
    func `Draggable attribute name is draggable`() {
        #expect(Draggable.attribute == "draggable")
    }

    @Test
    func `Draggable has three states`() {
        #expect(Draggable.allCases.count == 3)
        #expect(Draggable.true.rawValue == "true")
        #expect(Draggable.false.rawValue == "false")
        #expect(Draggable.auto.rawValue == "auto")
    }

    @Test
    func `Draggable from boolean literal`() {
        let draggable: Draggable = true
        #expect(draggable == .true)

        let notDraggable: Draggable = false
        #expect(notDraggable == .false)
    }

    @Test
    func `Contenteditable attribute name is contenteditable`() {
        #expect(Contenteditable.attribute == "contenteditable")
    }

    @Test
    func `Contenteditable has four states`() {
        #expect(Contenteditable.allCases.count == 4)
        #expect(Contenteditable.true.rawValue == "true")
        #expect(Contenteditable.empty.rawValue.isEmpty)
        #expect(Contenteditable.false.rawValue == "false")
        #expect(Contenteditable.plaintextOnly.rawValue == "plaintext-only")
    }

    @Test
    func `Contenteditable from boolean literal`() {
        let editable: Contenteditable = true
        #expect(editable == .true)

        let notEditable: Contenteditable = false
        #expect(notEditable == .false)
    }

    @Test
    func `Autocapitalize attribute name is autocapitalize`() {
        #expect(Autocapitalize.attribute == "autocapitalize")
    }

    @Test
    func `Autocapitalize has six modes`() {
        #expect(Autocapitalize.allCases.count == 6)
        #expect(Autocapitalize.none.rawValue == "none")
        #expect(Autocapitalize.off.rawValue == "off")
        #expect(Autocapitalize.sentences.rawValue == "sentences")
        #expect(Autocapitalize.on.rawValue == "on")
        #expect(Autocapitalize.words.rawValue == "words")
        #expect(Autocapitalize.characters.rawValue == "characters")
    }

    // MARK: Boolean Attributes

    @Test
    func `Autofocus attribute name is autofocus`() {
        #expect(Autofocus.attribute == "autofocus")
    }

    @Test
    func `Autofocus default init is true`() {
        let autofocus = Autofocus()
        #expect(autofocus.rawValue == true)
    }

    @Test
    func `Autofocus from boolean literal`() {
        let on: Autofocus = true
        #expect(on.rawValue == true)

        let off: Autofocus = false
        #expect(off.rawValue == false)
    }

    @Test
    func `Autofocus description reflects boolean state`() {
        #expect(Autofocus(value: true).description == "true")
        #expect(Autofocus(value: false).description == "false")
    }

    // MARK: Tabindex

    @Test
    func `Tabindex attribute name is tabindex`() {
        #expect(Tabindex.attribute == "tabindex")
    }

    @Test
    func `Tabindex stores integer value`() {
        let tab = Tabindex(5)
        #expect(tab.value == 5)
    }

    @Test
    func `Tabindex named constants`() {
        #expect(Tabindex.notTabbable.value == -1)
        #expect(Tabindex.inDocumentOrder.value == 0)
    }

    @Test
    func `Tabindex description is string of value`() {
        #expect(Tabindex(3).description == "3")
    }
}

// MARK: - Edge Case Tests

extension HTML.Test.EdgeCase {

    @Test
    func `Id with empty string`() {
        let id: Id = ""
        #expect(id.rawValue.isEmpty)
    }

    @Test
    func `Id with special characters`() {
        let id = Id("my-id_123")
        #expect(id.rawValue == "my-id_123")
    }

    @Test
    func `Class from empty array literal`() {
        let cls: Class = []
        #expect(cls.rawValue.isEmpty)
    }

    @Test
    func `Class from single element array literal`() {
        let cls: Class = ["solo"]
        #expect(cls.rawValue == "solo")
    }

    @Test
    func `Lang component init skips nil script subtag`() {
        let lang = Lang(language: "en", region: "US")
        #expect(lang.rawValue == "en-US")
    }

    @Test
    func `Lang component init skips nil region subtag`() {
        let lang = Lang(language: "en", script: "Latn")
        #expect(lang.rawValue == "en-Latn")
    }

    @Test
    func `Tabindex with negative value`() {
        let tab = Tabindex(-5)
        #expect(tab.value == -5)
        #expect(tab.description == "-5")
    }

    @Test
    func `Tabindex with maximum common value`() {
        let tab = Tabindex(32767)
        #expect(tab.value == 32767)
    }

    @Test
    func `StringAttribute dynamicMemberLookup forwards to String`() {
        let id: Id = "hello"
        #expect(id.isEmpty == false)
        #expect(id.count == 5)
    }

    @Test
    func `StringAttribute Equatable distinguishes values`() {
        let a: Dir = .ltr
        let b: Dir = .ltr
        let c: Dir = .rtl
        #expect(a == b)
        #expect(a != c)
    }

    @Test
    func `StringAttribute Hashable deduplicates in Set`() {
        let set: Set<Dir> = [.ltr, .rtl, .auto, .ltr]
        #expect(set.count == 3)
    }

    @Test
    func `BooleanAttribute allCases has two entries`() {
        #expect(Autofocus.allCases.count == 2)
    }
}

// MARK: - Integration Tests

extension HTML.Test.Integration {

    @Test
    func `HTML Standard re-exports WHATWG_HTML elements`() {
        #expect(HTML.Article.self == HTML.Article.self)
        #expect(HTML.Section.self == HTML.Section.self)
        #expect(HTML.Paragraph.self == HTML.Paragraph.self)
        #expect(HTML.Form.self == HTML.Form.self)
    }

    @Test
    func `HTML Standard re-exports geometry via GeometryConversion namespace`() {
        #expect(GeometryConversion.self == GeometryConversion.self)
    }

    @Test
    func `Multiple attribute types coexist without ambiguity`() {
        let id: Id = "test"
        let cls: Class = "container"
        let lang: Lang = .english
        let dir: Dir = .ltr
        let hidden = Hidden()
        let tabindex = Tabindex(0)

        #expect(id.rawValue == "test")
        #expect(cls.rawValue == "container")
        #expect(lang.rawValue == "en")
        #expect(dir.rawValue == "ltr")
        #expect(hidden.rawValue == "hidden")
        #expect(tabindex.value == 0)
    }
}
