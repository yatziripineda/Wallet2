//
//  ControlPanel.swift
//  Wallet2
//
//  Created by yatziri on 15/11/23.
//


import SwiftUI
import SwiftData


struct ControlPanel: View {
    @State private var isPresented = false
    @State private var searchQuery = ""
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var items: [Item]
    @Query private var categories: [Category]
    @Query private var acounts: [Acount]
    
    @Environment(\.colorScheme) var colorScheme
    
    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "dd MMM yyyy"
           return formatter
       }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ZStack{
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(colorScheme == .dark ? Color(red: 21/255, green:121/255, blue: 81/255) : /*@START_MENU_TOKEN@*/Color(red: 0.151, green: 0.848, blue: 0.534)/*@END_MENU_TOKEN@*/)
                        //
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(acounts){ acount in
                                    ZStack(alignment: .leading){
                                        Rectangle()
                                            .frame(width: 160, height: 170)
                                            .foregroundColor(colorScheme == .dark ? .black : .white)
                                            .cornerRadius(20)
                                            .shadow(radius: 5)
                                            .padding()
                                        VStack(alignment: .leading){
                                            Image(systemName: "banknote")
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .frame(width: 40.0, height: 40.0)
                                                .background(.red)
                                                .cornerRadius(5)
                                                .accessibilityHidden(true)
                                            
                                            Text(acount.name)
                                                .bold()
                                                .foregroundColor(.gray)
                                                .font(.subheadline)
                                            Text( acount.currentBalance , format: .number)
                                                .bold()
                                                .font(.title2)
                                            if let currency = acount.currency {
                                                Text(currency.acronym)
                                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            }
                                            
                                        }.padding(.leading, 27.0)
                                    }
                                }
                                
                            }
                            
                        }
                        
                        
                    }
                    Spacer()
                   
                    ZStack{
                        Color.white
                            .ignoresSafeArea()
                            .frame(height: 2000)
                        
                   
                            Form{
                                HStack{
                                    Text("Last records")
                                        .font(.title2)
                                        .bold()
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                }
                                
                                ForEach(items.sorted(by: { $0.date > $1.date }).prefix(10)) { item in
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
                                
                                
                                NavigationLink(
                                    destination: {
                                        AllRecords()
                                        
                                    },
                                    label:{
                                        HStack{
                                            
                                            Text("All records")
                                            
                                        }.padding()
                                    })
                                
                            }
                        
                    }
                }
            }
            .navigationTitle(" ")
//            21 121 81
            .background(colorScheme == .dark ? Color(red: 21/255, green:121/255, blue: 81/255) : /*@START_MENU_TOKEN@*/Color(red: 0.151, green: 0.848, blue: 0.534)/*@END_MENU_TOKEN@*/)
            .toolbar{
                ToolbarItemGroup {
                    
                    NavigationLink(destination: bell(),
                                   label:{
                        Image(systemName: "bell.fill")
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                    })
                    NavigationLink(destination: Configuration(), label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                    })
                    Button(
                        action: { isPresented.toggle() },
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                 })
                    .sheet(isPresented: $isPresented) {
                        Add()
                            
                            //.modelContainer(modelContext)
                    }
                    
                }
                
                
            }
            
            
        }
    }
}

#Preview {
    ControlPanel()
}


extension Color {
    static func getMyColor(_ textColor: String) -> Color {
        
        switch textColor {
           case "red":
               return Color.red
           case "blue":
               return Color.blue
           case "green":
               return Color.green
        case "yellow":
            return Color.yellow
           default:
               return Color.black
           }
    }
}
