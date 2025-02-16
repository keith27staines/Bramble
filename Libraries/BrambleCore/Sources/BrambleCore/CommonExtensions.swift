//
//  Useful extensions applicable anywhere.swift
//  BrambleCore
//
//  Created by Keith Staines on 16/02/2025.
//

public extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
