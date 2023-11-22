//
//  AllRecords.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import SwiftUI
import SwiftData

struct AllRecords: View {
    
    @Query private var items: [Item]
    @Environment(\.modelContext) private var modelContext
    
    @Environment(\.colorScheme) var colorScheme
    
    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "dd MMM yyyy"
           return formatter
       }
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(items){ item in
                    HStack{
                        if let category = item.category {
                            //if let acount = item.acount {
                            Image(systemName: "\(category.symbol)")
                                .foregroundColor(.white)
                                .frame(width: 40.0, height: 40.0)
                                .background(Color.getMyColor(category.color))
                                .cornerRadius(20)
                            VStack(alignment: .leading){
                                Text(category.name)
                                if let acount = item.acount{
                                    Text(acount.name)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                            }.padding()
                            Spacer()
                            VStack(alignment: .leading){
                                Text("\(item.amount, format: .number)$")
                                    .font(.headline)
                                    .foregroundColor(.red)
                                Text(dateFormatter.string(from: item.date))
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            //}
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                modelContext.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                }
            }
        }.navigationTitle("All Records")
            
    }
}

#Preview {
    AllRecords()
}
