//
//  MainGridView.swift
//  Bramble
//
//  Created by Keith Staines on 15/02/2025.
//

import SwiftUI

struct MainGridView: View {
    var body: some View {
        BackgroundColor
            .primaryBackground
            .color
            .overlay {
            Text("Main Grid View")
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    MainGridView()
}
