//
//  StatePickerView.swift
//  Bramble
//
//  Created by Keith Staines on 16/02/2025.
//

import SwiftUI
import BrambleCore

/// A SwiftUI view for selecting the state of a ticket.
public struct TicketStatePicker: View {
    
    /// A binding to the current state of the ticket.
    @Binding var currentState: TicketState
    
    /// Initializes the view with a binding to the current state.
    ///
    /// - Parameters:
    ///   - currentState: A binding to the current state of the ticket.
    public init(currentState: Binding<TicketState>) {
        _currentState = currentState
    }
    
    public var body: some View {
        Form {
            Picker("State", selection: $currentState) {
                ForEach(TicketState.allCases) { state in
                    Text(state.rawValue.capitalized).tag(state)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.horizontal)
        }
    }
}

#Preview {
    @Previewable @State var selectedState: TicketState = .new
    TicketStatePicker(currentState: $selectedState)
}
