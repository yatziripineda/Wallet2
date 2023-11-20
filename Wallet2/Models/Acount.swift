//
//  Acount.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import Foundation
import SwiftData

@Model
class Acount: Codable{
    
    @Attribute(.unique)
    var name: String
    var currentBalance: Double
    @Relationship(deleteRule: .nullify, inverse: \Currency.acounts)
    var currency: Currency?
    
    var items: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case currentBalance
        case currency
    }
    init(name: String, currentBalance: Double, currency: Currency?  , items: [Item]? = nil) {
        self.name = name
        self.currentBalance = currentBalance
        self.currency = currency
        self.items = items
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.currentBalance = try container.decode(Double.self, forKey: .currentBalance)
        self.currency = try container.decode(Currency.self, forKey: .currency)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(currentBalance, forKey: .currentBalance)
        try container.encode(currency, forKey: .currency)
    }
    
}
