# swift-html-standard

Use this package when you need the WHATWG HTML element and attribute types under the Institute's standard import. Start from `HTML`, which is `WHATWG.HTML` from swift-whatwg-html. The `HTML Standard` product also brings in forms and geometry. If you need only attribute types, use the `HTML Standard Attributes` product, and if you need only element types, use `HTML Standard Elements`. If you want to depend on the WHATWG implementation directly, use swift-whatwg-html.

## Laws

- A `HTML.Class.Attribute` written as an array literal joins its class names with single spaces. An empty array gives an empty value.
- `HTML.Lang.Attribute.init(language:script:region:)` joins the subtags with hyphens in the order language, script, region, and leaves out any subtag that is nil.
- `HTML.Hidden.Attribute.init()` gives the `hidden` state, not the empty one, and `HTML.Autofocus.Attribute.init()` gives true.
- A boolean literal used as a `HTML.Draggable.Attribute` or `HTML.Contenteditable.Attribute` picks the `true` or `false` keyword state. It does not add or remove the attribute.
