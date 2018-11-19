//
//  Country.swift
//  Wanderlust
//
//  Created by Benny Wong on 11/18/18.
//  Copyright © 2018 Benny Wong. All rights reserved.
//

import Foundation
import IGListKit

typealias Countries = [Country]

class Country: Codable, ListDiffable {
    let name: Name
    let tld: [String]
    let cca2, ccn3, cca3, cioc: String
    let independent: Bool?
    let status: Status
    let currency, callingCode, capital, altSpellings: [String]
    let region: Region
    let subregion: String
    let languages: [String: String]
    let translations: [String: Translation]
    let latlng: [Double]
    let demonym: String
    let landlocked: Bool
    let borders: [String]
    let area: Double
    let flag: String

    init(name: Name,
         tld: [String],
         cca2: String,
         ccn3: String,
         cca3: String,
         cioc: String,
         independent: Bool?,
         status: Status,
         currency: [String],
         callingCode: [String],
         capital: [String],
         altSpellings: [String],
         region: Region,
         subregion: String,
         languages: [String: String],
         translations: [String: Translation],
         latlng: [Double],
         demonym: String,
         landlocked: Bool,
         borders: [String],
         area: Double,
         flag: String) {
        self.name = name
        self.tld = tld
        self.cca2 = cca2
        self.ccn3 = ccn3
        self.cca3 = cca3
        self.cioc = cioc
        self.independent = independent
        self.status = status
        self.currency = currency
        self.callingCode = callingCode
        self.capital = capital
        self.altSpellings = altSpellings
        self.region = region
        self.subregion = subregion
        self.languages = languages
        self.translations = translations
        self.latlng = latlng
        self.demonym = demonym
        self.landlocked = landlocked
        self.borders = borders
        self.area = area
        self.flag = flag
    }

    // MARK: IGListDiffable

    func diffIdentifier() -> NSObjectProtocol {
        return cca2 as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.diffIdentifier().isEqual(object?.diffIdentifier())
    }
}

class Name: Codable {
    let common, official: String
    let native: [String: Translation]

    init(common: String, official: String, native: [String: Translation]) {
        self.common = common
        self.official = official
        self.native = native
    }
}

class Translation: Codable {
    let official, common: String

    init(official: String, common: String) {
        self.official = official
        self.common = common
    }
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}
