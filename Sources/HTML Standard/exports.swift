// exports.swift
// HTML Standard
//
// Re-exports WHATWG HTML with compatibility type aliases

@_exported import WHATWG_HTML
@_exported import WHATWG_HTML_Elements
@_exported import WHATWG_HTML_Attributes

// Compatibility type aliases for migration from swift-html-types
public typealias HTML_Standard_Elements = WHATWG_HTML
public typealias HTMLAttributeTypes = WHATWG_HTML
public typealias HTMLTypes = WHATWG_HTML
