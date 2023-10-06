//
//  Countries.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import Foundation

struct Country: Codable, Identifiable {
    var id: Int { return UUID().hashValue }
    var name: CountryName
    var latlng: [Double]
}

struct CountryName: Codable {
    var common: String
    var official: String
}
