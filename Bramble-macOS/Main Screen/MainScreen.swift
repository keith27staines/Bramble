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

struct TicketBoardView: View {
    @Binding var isInspectorVisible: Bool
    @State private var inspectorWidth: CGFloat = 300
    private let minInspectorWidth: CGFloat = 200
    private let maxInspectorWidth: CGFloat = 600

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                VStack {
                    HeaderView()
                        .frame(height: 50)
                        .background(Color.gray.opacity(0.2))

                    Divider()

                    MainGridView()
                        .frame(width: isInspectorVisible ? geometry.size.width - inspectorWidth : geometry.size.width)
                        .background(Color.white)
                }

                if isInspectorVisible {
                    Divider()
                        .frame(width: 2)
                        .background(Color.gray)
                        .gesture(DragGesture()
                            .onChanged { gesture in
                                let newWidth = inspectorWidth - gesture.translation.width
                                inspectorWidth = min(max(newWidth, minInspectorWidth), maxInspectorWidth)
                            })

                    InspectorView()
                        .frame(width: inspectorWidth)
                        .background(Color.gray.opacity(0.1))
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}







struct TicketBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TicketBoardView(isInspectorVisible: .constant(true))
    }
}
