//
//  Geometry.Conversion.swift
//  HTML Standard
//
//  Cross-domain geometry conversion utilities.
//
//  This file provides documentation and utilities for converting geometry
//  between different coordinate spaces (SVG, CSS, HTML).
//

@_exported public import Geometry_Primitives

// MARK: - Cross-Domain Conversion Documentation

/// # Cross-Domain Geometry Conversion
///
/// The unified geometry system uses phantom type parameters to distinguish
/// between coordinate spaces. You can convert between spaces using the
/// space functor `map` method added in Phase 1.
///
/// ## Example: SVG to CSS Conversion
///
/// When you import both `W3C SVG` and `W3C CSS`, you can convert:
///
/// ```swift
/// import W3C_SVG
/// import W3C_CSS
///
/// let svgCircle: SVG.Circle = SVG.Circle(
///     center: SVG.Point(x: 100, y: 100),
///     radius: 50
/// )
///
/// // Convert to CSS space using the space functor map
/// let cssCircle: CSS.Circle = svgCircle.map { point in
///     CSS.Point(x: point.x._rawValue, y: point.y._rawValue)
/// }
/// ```
///
/// ## Example: CSS to HTML Conversion
///
/// ```swift
/// import W3C_CSS
/// import WHATWG_HTML
///
/// let cssRect: CSS.Rectangle = ...
///
/// // Convert to HTML space (note: HTML uses Int for pixel values)
/// let htmlRect: HTML.DoubleRectangle = cssRect.map { point in
///     HTML.DoublePoint(x: point.x._rawValue, y: point.y._rawValue)
/// }
/// ```
///
/// ## Coordinate Space Markers
///
/// Each domain has its own coordinate space marker:
/// - `W3C_SVG.Space` - SVG coordinate space
/// - `W3C_CSS.Space` - CSS coordinate space
/// - `WHATWG_HTML.Space` - HTML coordinate space
///
/// These markers are phantom types that ensure type safety when working
/// with geometry from different domains.
public enum GeometryConversion {
    // This enum serves as documentation namespace
}

// MARK: - HTML Geometry Re-exports

/// Re-export HTML geometry types for convenience.
///
/// When using HTML Standard, you can access HTML geometry through
/// the `HTML` namespace from WHATWG HTML.
///
/// Note: After swift-whatwg-html is updated with the unified geometry
/// types, users can access `HTML.Width`, `HTML.Height`, etc.
