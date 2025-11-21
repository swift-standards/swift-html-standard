// HTML Standard Attributes.swift
// HTML Standard
//
// Compatibility wrapper for HTMLAttributeTypes
// Re-exports only attribute-related modules from WHATWG HTML

@_exported import WHATWG_HTML_FormAttributes
@_exported import WHATWG_HTML_GlobalAttributes
@_exported import WHATWG_HTML_LinkAttributes
@_exported import WHATWG_HTML_MediaAttributes
// Note: WHATWG_HTML_Metadata contains both the Content attribute and metadata elements (like <style>).
// This creates a naming conflict: Style attribute (from GlobalAttributes) vs Style element (from Metadata).
// In practice, this ambiguity is rare since attributes and elements are used in different contexts.
@_exported import WHATWG_HTML_Metadata
@_exported import WHATWG_HTML_ScriptAttributes
@_exported import WHATWG_HTML_Shared
@_exported import WHATWG_HTML_TableAttributes
