//
//  Category.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import Foundation
import SwiftData

@Model
class Category: Codable{
    
    @Attribute(.unique)
    var name: String
    var symbol: String
    var color: String
    var principalCategory: Bool
    var items: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case symbol
        case color
        case principalCategory
    }
    
    init(name: String, symbol: String,
        items: [Item]? = nil,
         color: String, principalCategory: Bool) {
        self.name = name
        self.symbol = symbol
        self.items = items
        self.color = color
        self.principalCategory = principalCategory
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.color = try container.decode(String.self, forKey: .color)
        self.principalCategory = try container.decode(Bool.self, forKey: .principalCategory)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(color, forKey: .color)
        try container.encode(principalCategory, forKey: .principalCategory)
    }
}
//extension Category {
//
//    static var defaults: [Category] {
//        [
//            .init(name: "Food & Drinks", symbol: "fork.knife", subcategory: 1, principalCategory: true),
//            .init(name: "Groceries", symbol: "carrot.fill", subcategory: 1, principalCategory: false),
//            .init(name: "Restaurant, fast-food", symbol: "cup.and.saucer", subcategory: 1, principalCategory: false)
//        ]
//    }
//}
