//
//  Tip.swift
//  Tooltips with TipKit
//
//  Created by jawad ali on 26/11/2023.
//

import Foundation
import TipKit

struct AddColorTip: Tip {
    var title: Text {
        Text("Add New Color")
            .foregroundStyle(.teal)
    }
    
    var message: Text? {
        Text("Tap here to add a new color to the list")
    }
    
    var image: Image? {
        Image(systemName: "paintpalette")
    }
}

struct SetFavoriteTip: Tip {
    static let setFavoriteEvent = Event(id: "setFavorite")
    static let colorsViewVisitedEvent = Event(id: "colorsViewVisited")
    var title: Text {
        Text("Set Favorite")
    }
    
    var message: Text? {
        Text("Tap and hold a color to add it to your favorites")
    }
    
    var rules: [Rule] {
        #Rule(Self.setFavoriteEvent) { event in
            event.donations.count == 0
        }
        
        #Rule(Self.colorsViewVisitedEvent) { event in
            event.donations.count > 2
        }
    }
}
