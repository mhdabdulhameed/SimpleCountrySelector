//
//  Utils.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import Foundation
import RxSwift

class Utils {
    static func getCountryCodes() -> Observable<[CountryViewModel]> {
        var countries = [CountryViewModel]()
        
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(CountryViewModel(countryFlag: countryCodeToFlag(code: code),
                                              countryCode: code,
                                              countryName: name))
        }
        return .just(countries)
    }
    
    static func countryCodeToFlag(code: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in code.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
