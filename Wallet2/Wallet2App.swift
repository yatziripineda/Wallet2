//
//  Wallet2App.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import SwiftUI
import SwiftData

@main
struct Wallet2App: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
    @AppStorage("isFirstTimeLaunch") private var isFirstTimeLaunch: Bool = true
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(ItemsContainer.create(shouldCreateDefaults: &isFirstTimeLaunch))
    }
}
