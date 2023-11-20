//
//  RecordContainer.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import Foundation
import SwiftData

actor ItemsContainer {
    
    @MainActor
    static func create(shouldCreateDefaults: inout Bool) -> ModelContainer {
        let schema = Schema([Item.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        
        if shouldCreateDefaults {
            shouldCreateDefaults = false
            
            let acounts = DefaultsJSON.decode(from: "DefoultAcount",
                                                 type: [Acount].self)
            acounts?.forEach {
                print(".")
                container.mainContext.insert($0)
            }
            
            
            
            let categories = DefaultsJSON.decode(from: "Default_Categories",
                                                 type: [Category].self)
            categories?.forEach {
                
                print("-")
                container.mainContext.insert($0)
            }
            
            
            
        
            let items = DefaultsJSON.decode(from: "DefaultItems",
                                            type: [Item].self)
            
         
            items?.forEach { item in
                print("=")
                container.mainContext.insert(item)
                item.category?.items?.append(item)
            }
//            print("Hola")
//            print(items)
//            print(acounts)
//            print(categories)

        }

        return container
    }
    
}
