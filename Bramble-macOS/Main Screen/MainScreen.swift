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
        TicketBoardView(isInspectorVisible: $isInspectorVisible)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { isInspectorVisible.toggle() }) {
                        Image(systemName: isInspectorVisible ? "sidebar.trailing" : "sidebar.leading")
                    }
                }
            }
    }
}

#Preview {
    MainScreen()
}


