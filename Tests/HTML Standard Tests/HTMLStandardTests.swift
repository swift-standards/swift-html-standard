import Testing

@testable import HTML_Standard

extension HTML {
    @Suite
    struct Test {
        @Suite struct Unit {}
        @Suite struct EdgeCase {}
        @Suite struct Integration {}
        @Suite(.serialized) struct Performance {}
    }
}

extension HTML.Test.Unit {

    @Test
    func `Id attribute name is id`() {
        #expect(HTML.Id.Attribute.attribute == "id")
    }

    @Test
    func `Id stores raw value from string literal`() {
        let id: HTML.Id.Attribute = "main-header"
        #expect(id.rawValue == "main-header")
    }

    @Test
    func `Id description matches rawValue`() {
        let id = HTML.Id.Attribute("section-1")
        #expect(id.description == "section-1")
    }

    @Test
    func `Class attribute name is class`() {
        #expect(HTML.Class.Attribute.attribute == "class")
    }

    @Test
    func `Class from string literal`() {
        let cls: HTML.Class.Attribute = "container"
        #expect(cls.rawValue == "container")
    }

    @Test
    func `Class from array literal joins with spaces`() {
        let cls: HTML.Class.Attribute = ["note", "editorial", "highlighted"]
        #expect(cls.rawValue == "note editorial highlighted")
    }

    @Test
    func `Lang attribute name is lang`() {
        #expect(HTML.Lang.Attribute.attribute == "lang")
    }

    @Test
    func `Lang common language constants`() {
        #expect(HTML.Lang.Attribute.english.rawValue == "en")
        #expect(HTML.Lang.Attribute.french.rawValue == "fr")
        #expect(HTML.Lang.Attribute.german.rawValue == "de")
        #expect(HTML.Lang.Attribute.japanese.rawValue == "ja")
        #expect(HTML.Lang.Attribute.arabic.rawValue == "ar")
    }

    @Test
    func `Lang regional variants`() {
        #expect(HTML.Lang.Attribute.americanEnglish.rawValue == "en-US")
        #expect(HTML.Lang.Attribute.britishEnglish.rawValue == "en-GB")
    }

    @Test
    func `Lang component init combines subtags`() {
        let lang = HTML.Lang.Attribute(language: "sr", script: "Cyrl", region: "RS")
        #expect(lang.rawValue == "sr-Cyrl-RS")
    }

    @Test
    func `Lang component init with only language`() {
        let lang = HTML.Lang.Attribute(language: "nl")
        #expect(lang.rawValue == "nl")
    }

    @Test
    func `Dir attribute name is dir`() {
        #expect(HTML.Dir.Attribute.attribute == "dir")
    }

    @Test
    func `Dir has three direction values`() {
        #expect(HTML.Dir.Attribute.allCases.count == 3)
        #expect(HTML.Dir.Attribute.ltr.rawValue == "ltr")
        #expect(HTML.Dir.Attribute.rtl.rawValue == "rtl")
        #expect(HTML.Dir.Attribute.auto.rawValue == "auto")
    }

    @Test
    func `Hidden attribute name is hidden`() {
        #expect(HTML.Hidden.Attribute.attribute == "hidden")
    }

    @Test
    func `Hidden default init produces hidden state`() {
        let hidden = HTML.Hidden.Attribute()
        #expect(hidden.rawValue == "hidden")
    }

    @Test
    func `Hidden has three states`() {
        #expect(HTML.Hidden.Attribute.allCases.count == 3)
        #expect(HTML.Hidden.Attribute.empty.rawValue.isEmpty)
        #expect(HTML.Hidden.Attribute.hidden.rawValue == "hidden")
        #expect(HTML.Hidden.Attribute.untilFound.rawValue == "until-found")
    }

    @Test
    func `Draggable attribute name is draggable`() {
        #expect(HTML.Draggable.Attribute.attribute == "draggable")
    }

    @Test
    func `Draggable has three states`() {
        #expect(HTML.Draggable.Attribute.allCases.count == 3)
        #expect(HTML.Draggable.Attribute.true.rawValue == "true")
        #expect(HTML.Draggable.Attribute.false.rawValue == "false")
        #expect(HTML.Draggable.Attribute.auto.rawValue == "auto")
    }

    @Test
    func `Draggable from boolean literal`() {
        let draggable: HTML.Draggable.Attribute = true
        #expect(draggable == .true)

        let notDraggable: HTML.Draggable.Attribute = false
        #expect(notDraggable == .false)
    }

    @Test
    func `Contenteditable attribute name is contenteditable`() {
        #expect(HTML.Contenteditable.Attribute.attribute == "contenteditable")
    }

    @Test
    func `Contenteditable has four states`() {
        #expect(HTML.Contenteditable.Attribute.allCases.count == 4)
        #expect(HTML.Contenteditable.Attribute.true.rawValue == "true")
        #expect(HTML.Contenteditable.Attribute.empty.rawValue.isEmpty)
        #expect(HTML.Contenteditable.Attribute.false.rawValue == "false")
        #expect(HTML.Contenteditable.Attribute.plaintextOnly.rawValue == "plaintext-only")
    }

    @Test
    func `Contenteditable from boolean literal`() {
        let editable: HTML.Contenteditable.Attribute = true
        #expect(editable == .true)

        let notEditable: HTML.Contenteditable.Attribute = false
        #expect(notEditable == .false)
    }

    @Test
    func `Autocapitalize attribute name is autocapitalize`() {
        #expect(HTML.Autocapitalize.Attribute.attribute == "autocapitalize")
    }

    @Test
    func `Autocapitalize has six modes`() {
        #expect(HTML.Autocapitalize.Attribute.allCases.count == 6)
        #expect(HTML.Autocapitalize.Attribute.none.rawValue == "none")
        #expect(HTML.Autocapitalize.Attribute.off.rawValue == "off")
        #expect(HTML.Autocapitalize.Attribute.sentences.rawValue == "sentences")
        #expect(HTML.Autocapitalize.Attribute.on.rawValue == "on")
        #expect(HTML.Autocapitalize.Attribute.words.rawValue == "words")
        #expect(HTML.Autocapitalize.Attribute.characters.rawValue == "characters")
    }

    @Test
    func `Autofocus attribute name is autofocus`() {
        #expect(HTML.Autofocus.Attribute.attribute == "autofocus")
    }

    @Test
    func `Autofocus default init is true`() {
        let autofocus = HTML.Autofocus.Attribute()
        #expect(autofocus.rawValue == true)
    }

    @Test
    func `Autofocus from boolean literal`() {
        let on: HTML.Autofocus.Attribute = true
        #expect(on.rawValue == true)

        let off: HTML.Autofocus.Attribute = false
        #expect(off.rawValue == false)
    }

    @Test
    func `Autofocus description reflects boolean state`() {
        #expect(HTML.Autofocus.Attribute(value: true).description == "true")
        #expect(HTML.Autofocus.Attribute(value: false).description == "false")
    }

    @Test
    func `Tabindex attribute name is tabindex`() {
        #expect(HTML.Tabindex.Attribute.attribute == "tabindex")
    }

    @Test
    func `Tabindex stores integer value`() {
        let tab = HTML.Tabindex.Attribute(5)
        #expect(tab.value == 5)
    }

    @Test
    func `Tabindex named constants`() {
        #expect(HTML.Tabindex.Attribute.notTabbable.value == -1)
        #expect(HTML.Tabindex.Attribute.inDocumentOrder.value == 0)
    }

    @Test
    func `Tabindex description is string of value`() {
        #expect(HTML.Tabindex.Attribute(3).description == "3")
    }
}

extension HTML.Test.EdgeCase {

    @Test
    func `Id with empty string`() {
        let id: HTML.Id.Attribute = ""
        #expect(id.rawValue.isEmpty)
    }

    @Test
    func `Id with special characters`() {
        let id = HTML.Id.Attribute("my-id_123")
        #expect(id.rawValue == "my-id_123")
    }

    @Test
    func `Class from empty array literal`() {
        let cls: HTML.Class.Attribute = []
        #expect(cls.rawValue.isEmpty)
    }

    @Test
    func `Class from single element array literal`() {
        let cls: HTML.Class.Attribute = ["solo"]
        #expect(cls.rawValue == "solo")
    }

    @Test
    func `Lang component init skips nil script subtag`() {
        let lang = HTML.Lang.Attribute(language: "en", region: "US")
        #expect(lang.rawValue == "en-US")
    }

    @Test
    func `Lang component init skips nil region subtag`() {
        let lang = HTML.Lang.Attribute(language: "en", script: "Latn")
        #expect(lang.rawValue == "en-Latn")
    }

    @Test
    func `Tabindex with negative value`() {
        let tab = HTML.Tabindex.Attribute(-5)
        #expect(tab.value == -5)
        #expect(tab.description == "-5")
    }

    @Test
    func `Tabindex with maximum common value`() {
        let tab = HTML.Tabindex.Attribute(32767)
        #expect(tab.value == 32767)
    }

    @Test
    func `StringAttribute dynamicMemberLookup forwards to String`() {
        let id: HTML.Id.Attribute = "hello"
        #expect(id.isEmpty == false)
        #expect(id.count == 5)
    }

    @Test
    func `StringAttribute Equatable distinguishes values`() {
        let a: HTML.Dir.Attribute = .ltr
        let b: HTML.Dir.Attribute = .ltr
        let c: HTML.Dir.Attribute = .rtl
        #expect(a == b)
        #expect(a != c)
    }

    @Test
    func `StringAttribute Hashable deduplicates in Set`() {
        let set: Set<HTML.Dir.Attribute> = [.ltr, .rtl, .auto, .ltr]
        #expect(set.count == 3)
    }

    @Test
    func `BooleanAttribute allCases has two entries`() {
        #expect(HTML.Autofocus.Attribute.allCases.count == 2)
    }
}

extension HTML.Test.Integration {

    @Test
    func `HTML Standard re-exports WHATWG_HTML elements`() {
        #expect(HTML.Article.Element.self == HTML.Article.Element.self)
        #expect(HTML.Section.Element.self == HTML.Section.Element.self)
        #expect(HTML.Paragraph.Element.self == HTML.Paragraph.Element.self)
        #expect(HTML.Form.Element.self == HTML.Form.Element.self)
    }

    @Test
    func `HTML Form resolves through the WHATWG_HTML nest alias`() {
        #expect(HTML.Form.Element.self == WHATWG.HTML.Form.Element.self)
    }

    @Test
    func `HTML Standard re-exports geometry via GeometryConversion namespace`() {
        #expect(GeometryConversion.self == GeometryConversion.self)
    }

    @Test
    func `Multiple attribute types coexist without ambiguity`() {
        let id: HTML.Id.Attribute = "test"
        let cls: HTML.Class.Attribute = "container"
        let lang: HTML.Lang.Attribute = .english
        let dir: HTML.Dir.Attribute = .ltr
        let hidden = HTML.Hidden.Attribute()
        let tabindex = HTML.Tabindex.Attribute(0)

        #expect(id.rawValue == "test")
        #expect(cls.rawValue == "container")
        #expect(lang.rawValue == "en")
        #expect(dir.rawValue == "ltr")
        #expect(hidden.rawValue == "hidden")
        #expect(tabindex.value == 0)
    }
}
