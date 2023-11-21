//
//  File.swift
//  Wallet2
//
//  Created by yatziri on 21/11/23.
//

import Foundation

@MainActor class ObsVar: ObservableObject{
    @Published var selectedCategori : Category = Category(name: "", symbol: "", color: "", principalCategory: true)
    @Published var selectedAcount: Acount = Acount(name: "", currentBalance: 2, currency: Currency(name: "", acronym: ""))
}
