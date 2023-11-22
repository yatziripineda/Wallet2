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
    @Environment(\.colorScheme) var colorScheme
    
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
    
    @State private var amountText: String = "-0"
    @State private var isEditing = false
    
    var item: Item = Item(tipeRecord: "", amount: 2, date: .now, note: "", warranty: 0)
   
    
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color(red: 29/255, green:29/255, blue: 29/255) : .red)
                    .frame(height: 100)
                
                HStack{
                    Button(
                        action: {                        },
                        label:{
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(colorScheme == .dark ? .black : .white)
                                    .frame(width: 60, height: 30)
                                
                                Text("MXN")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }).padding()
                    Spacer()
//                    HStack{
//                        Text("-")
//                            .font(.largeTitle)
//                            .bold()
//                            .foregroundColor(colorScheme == .dark ? .black : .white)
                    TextField("-0", text: Binding<String>(
                        get: {
                            return self.amountText
                        },
                        set: {
                            // Ensure that the text always starts with a hyphen
                            if $0.starts(with: "-") {
                                self.amountText = $0
                            } else {
                                self.amountText = "-\($0)"
                            }
                        }
                    ))
                    .keyboardType(.numberPad)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 200)
                    .padding()
                    
//                    }.padding()
                        
                }
            }
            .onTapGesture {
                hideKeyboard()
            }

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
                
            }.background(colorScheme == .dark ? .black : .white)
        }
//        .onTapGesture {
//           hideKeyboard()
//       }
   }
   private func hideKeyboard() {
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
          isEditing = false
      }
    
}
private extension  addExpense {
    
    func save() {
        item.date = selectedDate
        item.amount = Double(amountText)!
        modelContext.insert(item)
        item.category = selectedCategory
        selectedCategory?.items?.append(item)
        item.acount = selectedAcount
        selectedAcount?.items?.append(item)
        
    }
}

