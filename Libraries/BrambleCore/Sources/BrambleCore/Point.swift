//
//  Point.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

/// Represents a two-dimensional point with integer coordinates.
///
/// The `Point` struct is used to define a position in a coordinate system.
/// It supports encoding and decoding via `Codable`, and can be compared and stored in sets or dictionaries through `Equatable` and `Hashable` conformance.
///
/// ## Properties:
/// - `x`: The horizontal coordinate of the point.
/// - `y`: The vertical coordinate of the point.
///
/// ## Usage:
/// ```swift
/// let pointA = Point(x: 10, y: 20)
/// let pointB = Point(x: 15, y: 25)
/// print(pointA == pointB) // false
/// ```
///
/// The `Point` struct is commonly used for layout, positioning, and graphical representations.
public struct Point: Codable, Equatable, Hashable {
    
    /// The horizontal coordinate of the point.
    public var x: Int
    
    /// The vertical coordinate of the point.
    public var y: Int
    
    /// Initializes a new `Point` with the given `x` and `y` coordinates.
    ///
    /// - Parameters:
    ///   - x: The horizontal coordinate.
    ///   - y: The vertical coordinate.
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

