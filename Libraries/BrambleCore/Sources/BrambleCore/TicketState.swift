//
//  State.swift
//  BrambleCore
//
//  Created by Keith Staines on 15/02/2025.
//

/// Represents the different states a `Ticket` can be in throughout its lifecycle.
///
/// `TicketState` is used to track the progress of a ticket in a workflow or task management system.
/// It conforms to `Codable` for easy serialization and `Equatable` for state comparisons.
public enum TicketState: Codable, Equatable {
    
    /// The ticket has been created but has not yet been scheduled for work.
    case new

    /// The ticket is ready to be worked on but has not yet started.
    case readyForWork

    /// Work on the ticket is currently ongoing.
    case inProgress

    /// The ticket has been completed successfully.
    case done

    /// The ticket is currently blocked and cannot proceed.
    case blocked

    /// The ticket has been postponed for future consideration.
    case deferred

    /// The ticket has been cancelled and will not be completed.
    case cancelled
}

