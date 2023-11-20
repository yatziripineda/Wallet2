//
//  ContentView.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView {
            ControlPanel()
                .tabItem {
                    Label("Control Panel", systemImage: "house.fill")
                }

            Planning()
                .tabItem {
                    Label("Others", systemImage: "clock")
                }

//

            Statistics()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar.fill")
                }

            Others()
                .tabItem {
                    Label("Others", systemImage: "ellipsis.circle.fill")
                }
        }.navigationBarBackButtonHidden()
    }
}

//    private func addItem() {
//        withAnimation {
////            let newItem = Item(timestamp: Date())
////            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
////            for index in offsets {
////                modelContext.delete(items[index])
////            }
//        }
//    }


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
