//
//  InspectorView.swift
//  Bramble
//
//  Created by Keith Staines on 15/02/2025.
//

import SwiftUI

struct InspectorView: View {
    var body: some View {
        BackgroundColor
            .formBackground.color
            .overlay {
            Text("Inspector")
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    InspectorView()
}
