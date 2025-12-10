// exports.swift
// HTML Standard
//
// Re-exports WHATWG HTML with compatibility type aliases

@_exported import WHATWG_HTML
@_exported import WHATWG_HTML_Attributes
@_exported import WHATWG_HTML_Elements

public typealias HTML_Standard_Elements = WHATWG_HTML
public typealias HTMLAttributeTypes = WHATWG_HTML
public typealias HTMLTypes = WHATWG_HTML
public typealias Style = WHATWG_HTML_Metadata.Style
public typealias Cite = WHATWG_HTML_TextSemantics.Cite
public typealias Form = WHATWG_HTML_Forms.Form
public typealias Label = WHATWG_HTML_Forms.Label
public typealias Time = WHATWG_HTML_TextSemantics.Time
public typealias Title = WHATWG_HTML_Document.Title
