//
//  ViewSelectedDate.swift
//  Wallet2
//
//  Created by yatziri on 22/11/23.
//

import SwiftUI

struct ViewSelectedDate: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        
        DatePicker("Date & Time", selection: $selectedDate , displayedComponents: .date)
            .datePickerStyle(.graphical)
        
    }
}

//#Preview {
//    ViewSelectedDate()
//}
