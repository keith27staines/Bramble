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

    @FocusState private var isTitleFocused: Bool
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
        ZStack {
            // Use state color as the background
            RoundedRectangle(cornerRadius: 16)
                .fill(viewModel.ticket.state.stateColor)
                .shadow(color: .black.opacity(viewModel.isSelected ? 0.2 : 0), radius: viewModel.isSelected ? 10 : 0)
            
            VStack {
                titleField

                TicketStatePicker(currentState: $viewModel.ticket.state)
                    .frame(width: 150)
                    .padding()
            }
            .padding()
        }
        .padding()
        .onTapGesture {
            viewModel.toggleIsSelected()
            if isTitleFocused {
                isTitleFocused = false
            }
        }
    }
    
    var titleField: some View {
        TextField("Some interesting title", text: $viewModel.ticket.title)
            .font(.system(size: 24))
            .multilineTextAlignment(isTitleFocused ? .center : .leading)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .allowsTightening(true)
            .focused($isTitleFocused)
            .padding()
            .background(Color.white.opacity(0.5))
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
