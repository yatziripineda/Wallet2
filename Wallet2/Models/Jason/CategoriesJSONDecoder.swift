//
//  CategoriesJSONDecoder.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//
//import Foundation
//
//struct DefaultsJSON {
//    
//    static func decode<T: Codable>(from fileName: String, type: T.Type) -> T? {
//       
//        do {
//            guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
//                  let data = try? Data(contentsOf: url) else {
//                return nil
//            }
//            
//            let result = try JSONDecoder().decode(T.self, from: data)
//            
//            return result
//        } catch {
//            print(error)
//            return nil
//        }
//
//    }
//}
import Foundation

struct DefaultsJSON {

    static func decode<T: Codable>(from fileName: String, type: T.Type) -> T? {

        do {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                return nil
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601 // Configurar la estrategia de decodificación de fecha

            let result = try decoder.decode(T.self, from: data)

            return result
        } catch {
            print(error)
            return nil
        }

    }
}
