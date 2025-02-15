//
//  Ticket.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

import Foundation



public struct Ticket: Identifiable, Codable, Equatable {
    public let id: UUID
    public var title: String
    public var position: Point
    public var state: State

    public init(id: UUID = UUID(), title: String = "", position: Point, state: State = .new) {
        self.id = id
        self.title = title
        self.position = position
        self.state = state
    }
}
