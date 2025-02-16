//
//  TicketState+Colors.swift
//  Bramble
//
//  Created by Keith Staines on 16/02/2025.
//

import BrambleCore
import SwiftUI

/// Extension for `TicketState` to return a pastel color for each state.
extension TicketState {
    
    /// Returns a pastel color corresponding to the `TicketState`.
    public var stateColor: Color {
        switch self {
        case .new:
            return Color.pastelBlue
        case .readyForWork:
            return Color.pastelYellow
        case .inProgress:
            return Color.pastelGreen
        case .done:
            return Color.pastelPink
        case .blocked:
            return Color.pastelRed
        case .deferred:
            return Color.pastelPurple
        case .cancelled:
            return Color.pastelGray
        }
    }
}
