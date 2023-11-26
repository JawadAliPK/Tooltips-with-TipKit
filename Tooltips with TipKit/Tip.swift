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
    }
    
    var message: Text? {
        Text("Tap here to add a new color to the list")
    }
    
    var image: Image? {
        Image(systemName: "paintpalette")
    }
}
