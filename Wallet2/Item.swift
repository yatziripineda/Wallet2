//
//  Item.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
