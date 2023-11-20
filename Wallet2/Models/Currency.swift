import Foundation
import SwiftData


//var lables: String   //relation
//var status: String    //relation

@Model
class Currency: Codable{
    
//    @Attribute(.unique)
    var name: String
    var acronym: String
    var acounts: [Acount]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case acronym
    }
    
    init(name: String, acronym: String, acounts: [Acount]? = nil) {
        self.name = name
        self.acronym = acronym
        self.acounts = acounts
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.acronym = try container.decode(String.self, forKey: .acronym)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(acronym, forKey: .acronym)
    }
    
}
//extension Currency{
//    static var defaultsCurrency: [Currency]{
//
//    }
//}//
//  Currency.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

