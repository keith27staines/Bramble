//
//  TicketViewModel.swift
//  Bramble
//
//  Created by Keith Staines on 16/02/2025.
//

import SwiftUI
import BrambleCore

/// The view model for managing a ticket's state and actions.
@MainActor
public class TicketViewModel: ObservableObject {
    
    /// The current ticket being managed by the view model.
    @Published public var ticket: Ticket
    
    /// A reference to the ticket repository (mocked here as an in-memory store).
    private var repository: TicketRepository
    
    /// Initializes the view model with a ticket and a repository.
    ///
    /// - Parameters:
    ///   - ticket: The `Ticket` to be managed by the view model.
    ///   - repository: The repository used to persist and fetch tickets.
    public init(ticket: Ticket, repository: TicketRepository) {
        self.ticket = ticket
        self.repository = repository
    }
    
    /// Updates the ticket's state and saves the change in the repository.
    ///
    /// - Parameter state: The new state of the ticket.
    public func updateTicketState(to state: TicketState) {
        ticket.state = state
        _ = repository.saveTicket(ticket)
    }
    
    /// Updates the ticket's title and saves the change in the repository.
    ///
    /// - Parameter title: The new title of the ticket.
    public func updateTicketTitle(to title: String) {
        ticket.title = title
        _ = repository.saveTicket(ticket)
    }
}

