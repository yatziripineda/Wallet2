//
//  ViewSelectedCurrency.swift
//  Wallet2
//
//  Created by yatziri on 22/11/23.
//

import SwiftUI
import SwiftData

struct ViewSelectedCurrency: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    @Query private var currencyes: [Currency]
    
    @Binding var selectedCurrency: Currency?
    
    var body: some View {
        NavigationStack{
            Picker("", selection: $selectedCurrency) {
                ForEach (currencyes){  currency in
                    Text("\(currency.acronym)")
                        .tag(currency as Currency?)
                    
                }
                Text("None")
                    .tag(nil as Currency?)
            }.labelsHidden()
            
        }.navigationTitle("Currency")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar{
//                ToolbarItemGroup {
//                    
//                    Button(
//                        action: { isPresented2.toggle()
//                        },
//                        label: {
//                            Image(systemName: "plus.circle.fill")
//                        })
//                    .sheet(isPresented: $isPresented) {
//                        Add()
//                    }
//                }
//            }
    }
}
//
//#Preview {
//    ViewSelectedCurrency()
//}
