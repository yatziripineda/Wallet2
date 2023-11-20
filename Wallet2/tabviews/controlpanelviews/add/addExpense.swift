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
    
    @State private var selectedSegment = 0
    @State private var isPresented = false
    @State private var isPresented2 = false
    //@State private var showCreateToDo = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query private var acounts: [Acount]
    @Query private var categories: [Category]
    @Query private var currency: [Currency]
    
    
    @State var selectedAcount: Acount?
//    @Binding var selectedCategory: Category?
    @State var selectedCategory: Category?
    
    var item: Item = Item(tipeRecord: "", amount: 2, date: "", note: "", warranty: 0)
    
    
    
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
                    // ACOUNT
                    HStack{
                        Image(systemName: "banknote")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 50.0, height: 50.0)
                            .background(.red)
                            .cornerRadius(5)
                        Text("Acount")
                        Spacer()
                        Picker("", selection: $selectedAcount) {
                            ForEach (acounts){ acount in
                                Text(acount.name)
                                    .tag(acount as Acount?)
                            }.labelsHidden()
                                .pickerStyle(.inline)
                            Text("None")
                                .tag(nil as Category?)
                                .labelsHidden()
                                .pickerStyle(.inline)
                        }
                    }.padding()
                    //CATEGORY
                    NavigationLink(
                        destination: {
                            NavigationStack{
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
                                
                            }.navigationTitle("Categories")
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar{
                                    ToolbarItemGroup {
                                        
                                        Button(
                                            action: { isPresented2.toggle()
                                            },
                                            label: {
                                                Image(systemName: "plus.circle.fill")
                                            })
                                        .sheet(isPresented: $isPresented) {
                                            Add()
                                        }
                                    }
                                }
                            //
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
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            
                            
                            Text("Date & Time")
                                .foregroundStyle(Color.black)
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
                                
                                
                                Text("Labels")
                                
                            }.padding()
                        })
                    
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
        modelContext.insert(item)
        item.category = selectedCategory
        selectedCategory?.items?.append(item)
        item.acount = selectedAcount
        selectedAcount?.items?.append(item)
    }
}

#Preview {
    addExpense()
        .modelContainer(for: Item.self)
}
