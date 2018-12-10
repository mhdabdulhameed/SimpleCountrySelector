//
//  CountryViewModel.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

struct CountryViewModel {
    let countryFlag: String
    let countryCode: String
    let countryName: String
    
    var name: String {
        return "\(countryFlag) \(countryName)"
    }
}
