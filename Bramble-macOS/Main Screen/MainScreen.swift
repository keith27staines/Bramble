//
//  MainScreen.swift
//  Bramble
//
//  Created by Keith Staines on 15/02/2025.
//

import SwiftUI

import SwiftUI

struct MainScreen: View {
    @State private var isInspectorVisible = true

    var body: some View {
        TicketBoardView()
            .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    MainScreen()
}


