//
//  InMemoryTicketRepository.swift
//  Bramble
//
//  Created by Keith Staines on 16/02/2025.
//

import BrambleCore
import Foundation

public class InMemoryTicketRepository: TicketRepository {
    private var tickets: [Ticket] = []
    
    public init() {}
    
    public func fetchTickets() -> [Ticket] { tickets }
    
    public func fetchTicket(by id: UUID) -> Ticket? {
        tickets.first(where: { $0.id == id })
    }
    
    public func saveTicket(_ ticket: Ticket) -> Bool {
        if let index = tickets.firstIndex(where: { $0.id == ticket.id }) {
            tickets[index] = ticket
        } else {
            tickets.append(ticket)
        }
        return true
    }
    public func deleteTicket(by id: UUID) -> Bool {
        if let index = tickets.firstIndex(where: { $0.id == id }) {
            tickets.remove(at: index)
            return true
        }
        return false
    }
}
