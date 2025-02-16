//
//  TicketRepository.swift
//  BrambleCore
//
//  Created by Keith Staines on 16/02/2025.
//

import Foundation

/// A protocol defining the contract for storing and retrieving tickets.
public protocol TicketRepository {
    
    /// Fetches all tickets from the repository.
    ///
    /// - Returns: An array of `Ticket` objects.
    func fetchTickets() -> [Ticket]
    
    /// Fetches a ticket by its unique identifier.
    ///
    /// - Parameter id: The unique identifier of the ticket.
    /// - Returns: A `Ticket` if found, `nil` otherwise.
    func fetchTicket(by id: UUID) -> Ticket?
    
    /// Saves a ticket to the repository.
    ///
    /// - Parameter ticket: The `Ticket` object to be saved.
    /// - Returns: A boolean indicating whether the save operation was successful.
    func saveTicket(_ ticket: Ticket) -> Bool
    
    /// Deletes a ticket from the repository.
    ///
    /// - Parameter id: The unique identifier of the ticket to be deleted.
    /// - Returns: A boolean indicating whether the delete operation was successful.
    func deleteTicket(by id: UUID) -> Bool
}
