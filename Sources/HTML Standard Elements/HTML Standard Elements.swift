// HTML Standard Elements.swift
// HTML Standard
//
// Compatibility wrapper for HTMLElementTypes
// Re-exports only element-related modules from WHATWG HTML

@_exported import WHATWG_HTML_Shared
@_exported import WHATWG_HTML_Elements

// Backward compatibility typealiases for HTMLElementTypes
public typealias HTMLElement = WHATWG_HTML.Element
public typealias HTMLVoidElement = WHATWG_HTML.VoidElement
