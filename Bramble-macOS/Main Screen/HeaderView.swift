//
//  HeaderView.swift
//  Bramble
//
//  Created by Keith Staines on 15/02/2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        BackgroundColor
            .secondaryBackground
            .color
            .overlay {
            Text("Header")
                .foregroundStyle(.primary)
        }
            .frame(height: 44)
    }
}

#Preview {
    HeaderView()
}
