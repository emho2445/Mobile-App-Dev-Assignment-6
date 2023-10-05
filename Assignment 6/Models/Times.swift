//
//  Times.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import Foundation

struct LocationTimes: Codable {
    var results: SunDetails
    var status: String
}

struct SunDetails: Codable{
    var sunrise: String
    var sunset: String
    var solar_noon: String
    var day_length: String
    var civil_twilight_begin: String
    var civil_twilight_end: String
    var nautical_twilight_begin: String
    var nautical_twilight_end: String
    var astronomical_twilight_begin: String
    var astronomical_twilight_end: String
}
