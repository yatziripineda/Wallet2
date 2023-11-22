//
//  Items.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import Foundation
import SwiftData

@Model
final class Item :Codable {
    var tipeRecord: String
    var amount: Double
    
//    @Relationship(deleteRule: .nullify, inverse: \Currency)
//    var currency: Currency?
    
    @Relationship(deleteRule: .nullify, inverse: \Acount.items)
    var acount: Acount?
    
    @Relationship(deleteRule: .nullify, inverse: \Category.items)
    var category: Category?
    
    var date: Date
    //var lables: String   //relation
    var note: String
//    var payee: String   //relation
//    var paymentType: String
    
    var warranty: Int
    //var status: String    //relation
    
//    @Attribute(.externalStorage)
//    var image: Data?
    
    enum CodingKeys: String, CodingKey {
        case tipeRecord
        case amount
        case acount
        case category
        case date
        case note
        case warranty
        
    }
    
    
    init(tipeRecord: String, amount: Double, acount: Acount? = nil,
         category: Category? = nil,
         date: Date, note: String, warranty: Int
//         image: Data? = nil
    ) {
        self.tipeRecord = tipeRecord
        self.amount = amount
        self.acount = acount
        self.category = category
        self.date = date
        self.note = note
        self.warranty = warranty
//        self.image = image
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tipeRecord = try container.decode(String.self, forKey: .tipeRecord)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.date = try container.decode(Date.self, forKey: .date)
        self.note = try container.decode(String.self, forKey: .note)
        self.warranty = try container.decode(Int.self, forKey: .warranty)
//        self.acount = try container.decodeIfPresent(Acount.self, forKey: .acount)
        self.category = try container.decodeIfPresent(Category.self, forKey: .category)
//
//        if let imageName = try container.decodeIfPresent(String.self, forKey: .imageName),
//           let imageData = UIImage(named: imageName) {
//            self.image = imageData.jpegData(compressionQuality: 0.8)
//        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tipeRecord, forKey: .tipeRecord)
        try container.encode(amount, forKey: .amount)
        try container.encode(date, forKey: .date)
        try container.encode(note, forKey: .note)
        try container.encode(warranty, forKey: .warranty)
        try container.encode(category, forKey: .category)
    }
    
}
//extension Item{
//
//    static var defaultsItem: [Item] {
//        [
//            .init(tipeRecord: "cash", amount: 24, date: "mondey", note: "Hola", warranty: 1)
//        ]
//    }
//}
