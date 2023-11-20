//
//  SelectedCategory.swift
//  Wallet2
//
//  Created by yatziri on 20/11/23.
//

import SwiftUI
import SwiftData

struct SelectedCategory: View {
    @Binding var selectedCategory: Category?
    
    @State private var selectedSegment = 0
    @State private var isPresented = false
    @State private var isPresented2 = false
    //@State private var showCreateToDo = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query private var categories: [Category]
    
//    @State var selectedCategory: Category?
    
    var body: some View {
        //        NavigationStack{
        List() {
            Section(header: Text("ALL CATEGORIES")) {
                ForEach (categories){ category in
                    if (category.principalCategory){
                       
                        NavigationLink(
                            destination: {
                                NavigationStack{
                                    List() {
                                        
                                        Section() {
                                            HStack{
                                                Image(systemName: category.symbol)
                                                    .foregroundColor(.white)
                                                    .frame(width: 40.0, height: 40.0)
                                                    .background(Color.getMyColor(category.color))
                                                    .cornerRadius(20)
                                                Text("\(category.name)")
                                            }
                                        }
                                        Section(header: Text("SUBCATEGORIES")) {
                                            Picker("", selection: $selectedCategory) {
                                                ForEach (categories){ subcategory in
                                                    if((category.color == subcategory.color)&&(category.name != subcategory.name)){
                                                        
                                                        HStack{
                                                            Image(systemName: subcategory.symbol)
                                                                .foregroundColor(.white)
                                                                .frame(width: 40.0, height: 40.0)
                                                                .background(Color.getMyColor(subcategory.color))
                                                                .cornerRadius(20)
                                                            Text("\(subcategory.name)")
                                                            
                                                        }.tag(subcategory as Category?)
                                                    }
                                                }
                                                Text("None")
                                                    .tag(nil as Category?)
                                            }.labelsHidden()
                                                .pickerStyle(.inline)
//                                                .onTapGesture(perform: dismiss)
                                        }
                                    }
                                }
                            },
                            label:{
                                HStack{
                                    
                                    Image(systemName: category.symbol)
                                        .foregroundColor(.white)
                                        .frame(width: 40.0, height: 40.0)
                                        .background(Color.getMyColor(category.color))
                                        .cornerRadius(20)
                                    Text("\(category.name)")
                                }
                            })
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    SelectedCategory(selectedCategory: .constant(Category(name: "", symbol: "", color: "", principalCategory: true)))
}
