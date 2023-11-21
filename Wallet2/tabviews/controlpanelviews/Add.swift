//
//  Add.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//

import SwiftUI
import SwiftData



enum ColorName: String {
    case red
    case blue
    case green
    // Add more colors as needed

    func toColor() -> Color {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        // Handle other cases
        }
    }
}

// Usage
//let colorString = "red"
//if let colorName = ColorName(rawValue: colorString) {
//    let color = colorName.toColor()  // This will be a SwiftUI Color
//}

struct Add: View {
    
    
    @State private var selectedSegment = 0
    @State private var isPresented = false
    @State private var isPresented2 = false
    //@State private var showCreateToDo = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query private var acounts: [Acount]
    @Query private var categories: [Category]
    @Query private var currency: [Currency]
    
    
//    @State var selectedAcount: Acount?
//    @State var selectedCategory: Category?
//    var item: Item = Item(tipeRecord: "", amount: 2, date: "", note: "", warranty: 0)
//    
    
    var body: some View{
        NavigationStack{
            VStack{
                VStack {
                    Picker("Options", selection: $selectedSegment) {
                        Text("Bills").tag(0)
                        Text("Income").tag(1)
                        Text("Transfers").tag(2)
                    }
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
//                    HStack{
//                        Button(
//                            action: {
//                                
//                            },
//                            label:{
//                                
//                                    Text("MXN")
//                            })
//                        Spacer()
//                        Text("-5000")
//                            .font(.largeTitle)
//                            .bold()
//                            .foregroundColor(.white)
//                    }
//                    .padding(
                    
                    
                    if(selectedSegment == 0){
                        ZStack{
                            
                            addExpense()
                        }.background(Color.white)
                        
                    }else{
                        if(selectedSegment == 1){
                            
                        }else{
                            
                        }
                    }
                }
                .navigationTitle("Add record")
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color.red)
    
                
              
//
                
            }
            
        }
    }
}


#Preview {
    Add()
        .modelContainer(for: Item.self)
}

