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
    let setFavoriteTip = SetFavoriteTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TipView(setFavoriteTip)
                    .tipBackground(.teal.opacity(0.2))
                ForEach(colors, id: \.self) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill($0.gradient)
                        .frame(height: 100)
                        .contextMenu {
                            Button("Favorite", systemImage: "star") {
                                // code to set as favorite
                                Task { await SetFavoriteTip.setFavoriteEvent.donate() }
                            }
                        }
                }
            }
            .onAppear {
                Task { await SetFavoriteTip.colorsViewVisitedEvent.donate() }

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
