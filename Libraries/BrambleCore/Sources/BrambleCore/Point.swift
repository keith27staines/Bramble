//
//  Point.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

public struct Point: Codable, Equatable, Hashable {
    public var x: Int
    public var y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
