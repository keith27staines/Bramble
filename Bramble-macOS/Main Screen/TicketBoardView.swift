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
    let dividerWidth = CGFloat(1)

    var body: some View {
        GeometryReader { geometry in
            
            let contentWidth = geometry.size.width - (isInspectorVisible ? (inspectorWidth + dividerWidth) : 0)
            
            ZStack {
                // Right-aligned Inspector is covered by the main stack when the inspector is not visible
                insepectorArea
                
                // The main grid and header
                ContentArea(contentWidth: contentWidth)
                    .animation(.easeInOut(duration: 0.3), value: isInspectorVisible)
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
                .frame(width: dividerWidth)
                .background(Color.gray)
                .pointerStyle(.columnResize(directions: [.leading, .trailing]))
                .gesture(DragGesture()
                    .onChanged { gesture in
                        let newWidth = inspectorWidth - gesture.translation.width
                        inspectorWidth = min(max(newWidth, minInspectorWidth), maxInspectorWidth)
                    })
            
            InspectorView()
                .frame(width: inspectorWidth)
        }
    }
    
    struct ContentArea: View {
        
        let contentWidth: CGFloat
        
        var body: some View {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HeaderView()
                    Divider()
                    MainGridView()
                }
                .frame(width: contentWidth)
                Spacer()
            }
        }
    }
}

struct TicketBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TicketBoardView()
    }
}
