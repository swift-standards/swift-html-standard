# swift-html-standard

[![CI](https://github.com/swift-standards/swift-html-standard/workflows/CI/badge.svg)](https://github.com/swift-standards/swift-html-standard/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Compatibility wrapper providing unified access to WHATWG HTML implementation with familiar API structure.

## Overview

swift-html-standard is a lightweight wrapper around [swift-whatwg-html](https://github.com/swift-standards/swift-whatwg-html) that provides a simplified, unified API structure. It offers three main products for different use cases: complete HTML implementation, attributes-only, or elements-only.

This package serves as the recommended entry point for projects migrating from swift-html-types or seeking a simpler import structure than the modular swift-whatwg-html organization.

## Features

- **Zero-cost abstraction**: Direct re-exports with no wrapper types or runtime overhead
- **Simplified imports**: Three focused products instead of 26 individual modules
- **Complete WHATWG compliance**: Full backing by swift-whatwg-html implementation
- **Flexible granularity**: Import everything, just attributes, or just elements
- **Type aliases**: Convenient `HTMLElement` and `HTMLVoidElement` aliases
- **Swift 6 concurrency**: Full Sendable conformance with strict concurrency mode
- **Migration path**: Drop-in replacement for swift-html-types with minimal changes

## Installation

### Swift Package Manager

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-html-standard", from: "0.1.0")
]
```

## Quick Start

### Complete Implementation

```swift
import HTML_Standard

// Access all HTML elements and attributes
let input = Input(
    name: Name("email"),
    disabled: nil,
    form: nil,
    type: .email(Input.Email(value: Value("")))
)
```

### Attributes Only

```swift
import HTML_Standard_Attributes

// Access only HTML attribute types
let name = Name("username")
let placeholder = Placeholder("Enter username")
let required = Required()
```

### Elements Only

```swift
import HTML_Standard_Elements

// Access only HTML element types
let form = Form(
    action: Action("/submit"),
    method: Method.post,
    enctype: EncType.multipart
)
```

## Usage

### Available Products

#### HTML Standard
Complete implementation with all elements and attributes:

```swift
import HTML_Standard

// Everything is available
let video = Video(
    src: Src("/video.mp4"),
    controls: Controls(),
    preload: Video.Preload.metadata
)
```

#### HTML Standard Attributes
All attribute modules (GlobalAttributes, FormAttributes, LinkAttributes, MediaAttributes, TableAttributes, ScriptAttributes, Metadata):

```swift
import HTML_Standard_Attributes

// Attribute types only
let href = Href("https://example.com")
let rel = Rel.stylesheet
let target = Target.blank
```

#### HTML Standard Elements
All element modules organized by WHATWG spec sections:

```swift
import HTML_Standard_Elements

// Element types with convenient aliases
typealias Element = HTMLElement  // WHATWG_HTML.Element
typealias VoidElement = HTMLVoidElement  // WHATWG_HTML.VoidElement

let section = Section()
let article = Article()
```

### Type Aliases

The Elements product provides convenient aliases:

```swift
import HTML_Standard_Elements

// These are equivalent:
let element1: HTMLElement = ...
let element2: WHATWG_HTML.Element = ...

let void1: HTMLVoidElement = ...
let void2: WHATWG_HTML.VoidElement = ...
```

### Migration from swift-html-types

Replace imports:

```swift
// Old
import HTMLTypes
import HTMLAttributeTypes
import HTMLElementTypes

// New
import HTML_Standard
import HTML_Standard_Attributes
import HTML_Standard_Elements
```

Type names remain the same - only imports change.

## Requirements

- Swift 6.2+
- macOS 15.0+ / iOS 18.0+ / tvOS 18.0+ / watchOS 11.0+
- Swift 6 language mode with strict concurrency

## Architecture

### Package Structure

```
swift-html-standard/
├── HTML Standard/            # Complete implementation
│   └── Re-exports WHATWG HTML
├── HTML Standard Attributes/ # Attributes only
│   ├── WHATWG HTML Shared
│   ├── WHATWG HTML GlobalAttributes
│   ├── WHATWG HTML FormAttributes
│   ├── WHATWG HTML LinkAttributes
│   ├── WHATWG HTML MediaAttributes
│   ├── WHATWG HTML TableAttributes
│   ├── WHATWG HTML ScriptAttributes
│   └── WHATWG HTML Metadata
└── HTML Standard Elements/   # Elements only
    ├── WHATWG HTML Shared
    └── WHATWG HTML Elements
```

### Design Principles

1. **Zero-cost wrapper**: All types are re-exported directly, no intermediate layers
2. **Simplified organization**: Three products instead of 26 modules
3. **Familiar structure**: Matches expectations from swift-html-types
4. **Full compliance**: Backed by complete WHATWG HTML Living Standard implementation
5. **Flexible imports**: Choose the granularity you need

## Related Packages

### Implementation
- [swift-whatwg-html](https://github.com/swift-standards/swift-whatwg-html): Complete, modular WHATWG HTML Living Standard implementation

### Used By
- [swift-html-css-pointfree](https://github.com/coenttb/swift-html-css-pointfree): Integration with pointfree-html for HTML generation

### Dependencies
- [swift-whatwg-html](https://github.com/swift-standards/swift-whatwg-html): WHATWG HTML implementation
  - [swift-rfc-2045](https://github.com/swift-standards/swift-rfc-2045): RFC 2045 MIME types
  - [swift-iso-8601](https://github.com/swift-standards/swift-iso-8601): ISO 8601 date/time
  - [swift-standards](https://github.com/swift-standards/swift-standards): Shared utilities

## Contributing

Contributions are welcome! This package is a thin wrapper, so most contributions should go to [swift-whatwg-html](https://github.com/swift-standards/swift-whatwg-html). For wrapper-specific issues:

- Ensure changes maintain zero-cost abstraction
- Tests pass with Swift 6.2
- Code follows existing style

## License

This project is licensed under the Apache License 2.0. See [LICENSE.md](LICENSE.md) for details.
