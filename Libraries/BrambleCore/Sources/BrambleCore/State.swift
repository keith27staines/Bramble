//
//  State.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

public enum State: Codable, Equatable {
    case new
    case readyForWork
    case inProgress
    case done
    case blocked
    case deferred
    case cancelled
}
