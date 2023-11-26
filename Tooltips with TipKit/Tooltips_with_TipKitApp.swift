//
//  Tooltips_with_TipKitApp.swift
//  Tooltips with TipKit
//
//  Created by jawad ali on 26/11/2023.
//

import SwiftUI
import TipKit

@main
struct Tooltips_with_TipKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([
//                        .displayFrequency(.immediate)
                        .datastoreLocation(.applicationDefault)])
                }
        }
    }
}
