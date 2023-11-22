//
//  addExpense.swift
//  Wallet2
//
//  Created by yatziri on 17/11/23.
//
//


import SwiftUI
import SwiftData

struct addExpense: View {
//    @Binding var obsVar: ObsVar
    
    @State private var selectedSegment = 0
    @State private var isPresented = false
    @State private var isPresented2 = false
    @State private var showDatePicker = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query private var acounts: [Acount]
    @Query private var categories: [Category]
    @Query private var currency: [Currency]
    
    
    @State var selectedAcount: Acount?
    @State var selectedCategory: Category?
    @State var selectedDate = Date()
    
    
    var item: Item = Item(tipeRecord: "", amount: 2, date: .now, note: "", warranty: 0)
   
    
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(.red)
                
                HStack{
                    Button(
                        action: {
                            
                        },
                        label:{
                            
                            Text("MXN")
                        })
                    Spacer()
                    Text("-5000")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
            }
            .frame(height: 100)
            .ignoresSafeArea(.all,edges: .all)
            

            List() {
                Section(header: Text("GENERAL")) {
                    //ACOUNT
                    ViewSelectAcount(selectedAcount: $selectedAcount)
                    
                    //CATEGORY
                    NavigationLink(
                        destination: {
                            SelectedCategory(selectedCategory: $selectedCategory)
                        },
                        label:{
                            HStack{
                                
                                Image(systemName: "questionmark")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 40.0, height: 40.0)
                                    .background(.gray)
                                    .cornerRadius(30)
                                Text("Category")
                                Spacer()
                                
                            }.padding()
                        })
                    
                    //DATE
                    Button(action: {
                        showDatePicker.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "calendar")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 40.0, height: 40.0)
                                .background(.gray)
                                .cornerRadius(30)
                            Text("Select Date")
                            Spacer()
                        }.padding()
                    })
                    if showDatePicker{
                        VStack {
                            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(.graphical)
                                .padding()
                            
                        }
                    }
                    
//
                    
                }
                Section(header: Text("MORE DETAIL")) {
                    NavigationLink(
                        destination: {
                            NavigationView{
                                List{
                                    
                                }
                                
                            }
                        },
                        label:{
                            HStack{
                                Text("Note")
                                
                            }.padding()
                        })
                    
                    NavigationLink(
                        destination: {
                            NavigationView{
                                List{
                                    
                                }
                                
                            }
                        },
                        label:{
                            HStack{
                                Text("Payee")
                                
                            }.padding()
                        })
                    
                    NavigationLink(
                        destination: {
                            NavigationView{
                                List{
                                    
                                }
                                
                            }
                        },
                        label:{
                            HStack{
                                
                                
                                Text("Payment type")
                                
                            }.padding()
                        })
                    NavigationLink(
                        destination: {
                            NavigationView{
                                List{
                                    
                                }
                                
                            }
                        },
                        label:{
                            HStack{
                                
                                
                                Text("Warranty")
                                
                            }.padding()
                        })
                    NavigationLink(
                        destination: {
                            NavigationView{
                                List{
                                    
                                }
                                
                            }
                        },
                        label:{
                            HStack{
                                
                                
                                Text("Status")
                                
                            }.padding()
                        })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            
                            
                            Text("Add location")
                            
                        }.padding()
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            
                            
                            Text("Attach photo")
                            
                        }.padding()
                    })
                    
                }
            }
            Divider()
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                    .frame( height: 40.0)
                    .cornerRadius(8)
                    .padding()
                Button("Save") {
                    save()
                    dismiss()
                }
                .bold()
                .foregroundColor(.white)
                
            }.background(.white)
        }
    }
}
private extension  addExpense {
    
    func save() {
        item.date = selectedDate
        modelContext.insert(item)
        item.category = selectedCategory
        selectedCategory?.items?.append(item)
        item.acount = selectedAcount
        selectedAcount?.items?.append(item)
        
    }
}

