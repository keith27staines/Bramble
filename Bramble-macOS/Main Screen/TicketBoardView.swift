//
//  TicketBoardView.swift
//  Bramble
//
//  Created by Keith Staines on 15/02/2025.
//

import SwiftUI

struct TicketBoardView: View {
    @State private var inspectorWidth: CGFloat = 300
    @State private var isInspectorVisible: Bool = true
    private let minInspectorWidth: CGFloat = 200
    private let maxInspectorWidth: CGFloat = 600

    var body: some View {
        GeometryReader { geometry in
            
            let contentWidth = geometry.size.width - (isInspectorVisible ? inspectorWidth : 0)
            
            ZStack {
                // Right-aligned Inspector is covered by the main stack when the inspector is not visible
                insepectorArea
                
                // The main grid and header
                HStack {
                    contentArea
                        .frame(width: contentWidth)
                        .animation(.easeInOut(duration: 0.3), value: isInspectorVisible)
                    Spacer()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    withAnimation {
                        isInspectorVisible.toggle()
                    }
                }) {
                    Image(systemName: isInspectorVisible ? "sidebar.trailing" : "sidebar.leading")
                }
            }
        }
    }
}

extension TicketBoardView {
    
    var insepectorArea: some View {
        HStack(spacing: 0) {
            Spacer()
            Divider()
                .frame(width: 2)
                .background(Color.gray)
                .gesture(DragGesture()
                    .onChanged { gesture in
                        let newWidth = inspectorWidth - gesture.translation.width
                        inspectorWidth = min(max(newWidth, minInspectorWidth), maxInspectorWidth)
                    })
            
            InspectorView()
                .frame(width: inspectorWidth - 2)
        }
    }
    
    var contentArea: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
            Divider()
            MainGridView()
        }
    }
}


struct TicketBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TicketBoardView()
    }
}
