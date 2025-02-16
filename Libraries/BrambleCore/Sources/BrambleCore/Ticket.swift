//
//  Ticket.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

import Foundation

/// A model representing a ticket, which can be used in task management systems or similar applications.
///
/// The `Ticket` struct conforms to `Identifiable`, `Codable`, and `Equatable`, making it suitable for use in SwiftUI lists,
/// serialization, and equality comparisons.
///
/// ## Usage:
/// ```swift
/// let ticket = Ticket(title: "Fix UI Bug", position: Point(x: 10, y: 20))
/// ```
public struct Ticket: Identifiable, Codable, Equatable {
    
    /// A unique identifier for the ticket.
    public let id: UUID

    /// The title or description of the ticket.
    public var title: String

    /// The current state of the ticket, such as `new`, `inProgress`, or `completed`.
    public var state: TicketState

    /// Creates a new instance of `Ticket`.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the ticket. Defaults to a new `UUID`.
    ///   - title: A descriptive title for the ticket. Defaults to an empty string.
    ///   - state: The current state of the ticket. Defaults to `.new`.
    public init(
        id: UUID = UUID(),
        title: String = "",
        state: TicketState = .new
    ) {
        self.id = id
        self.title = title
        self.state = state
    }
}

