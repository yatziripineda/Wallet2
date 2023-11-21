//
//  SelectAcount.swift
//  Wallet2
//
//  Created by yatziri on 21/11/23.
//

import SwiftUI
import SwiftData

struct ViewSelectAcount: View {
    //@StateObject var obsVar: ObsVar
    @Query private var acounts: [Acount]
    @Binding var selectedAcount: Acount?
    
    var body: some View {
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
    }
}

//#Preview {
//    ViewSelectAcount()
//}
