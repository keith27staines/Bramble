//
//  TicketView.swift
//  Bramble
//
//  Created by Keith Staines on 16/02/2025.
//

import SwiftUI
import BrambleCore

/// A SwiftUI view for displaying and interacting with a ticket.
public struct TicketView: View {
    
    /// The view model responsible for managing the ticket's state and actions.
    @StateObject private var viewModel: TicketViewModel
    
    /// Initializes the view with a ticket and a repository.
    ///
    /// - Parameters:
    ///   - ticket: The `Ticket` to be managed by the view model.
    ///   - repository: The repository used to persist and fetch tickets.
    public init(ticket: Ticket, repository: TicketRepository) {
        _viewModel = StateObject(wrappedValue: TicketViewModel(ticket: ticket, repository: repository))
    }
    
    public var body: some View {
        VStack {
            TextField("Title", text: $viewModel.ticket.title)
                .padding()
                .border(Color.gray)
            
            Text("State: \(viewModel.ticket.state.rawValue)")

            TicketStatePicker(currentState: $viewModel.ticket.state)
                .padding()
        }
        .padding()
    }
}

#Preview {
    let ticket = Ticket()
    let repository = InMemoryTicketRepository()
    TicketView(
        ticket: ticket,
        repository: repository
    )
}
