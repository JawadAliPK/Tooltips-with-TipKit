//
//  ContentView.swift
//  Tooltips with TipKit
//
//  Created by jawad ali on 26/11/2023.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State private var colors = MockData.colors
    let addColorTip = AddColorTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(colors, id: \.self) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill($0.gradient)
                        .frame(height: 100)
                        .contextMenu {
                            Button("Favorite", systemImage: "star") {
                                
                            }
                        }
                }
            }
            .padding()
            .navigationTitle("Colors")
            .toolbar {
                Button {
                    colors.insert(.random, at: 0)
                    addColorTip.invalidate(reason: .actionPerformed)
                } label: {
                    Image(systemName: "plus")
                }
                .popoverTip(addColorTip)
            }
        }
    }
}

#Preview {
    ContentView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
//                        .displayFrequency(.immediate)
                .datastoreLocation(.applicationDefault)])
        }
}

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

struct MockData {
    static let colors = [Color.random,
                         Color.random,
                         Color.random,
                         Color.random
    ]
}
