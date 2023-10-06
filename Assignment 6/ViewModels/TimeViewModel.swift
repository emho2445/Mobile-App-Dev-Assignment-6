//
//  TimeViewModel.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import Foundation

class TimeViewModel: ObservableObject {
    @Published var locationTimes: LocationTimes?
    @Published var lat: String = ""
    @Published var lng: String = ""
    
    @MainActor
    func getSunTimes() async -> () {
        do {
            let url = URL(string: "https://api.sunrise-sunset.org/json?lat=\(lat)&lng=\(lng)")!
            let (data, _) = try await URLSession.shared.data(from: url)
                locationTimes = try JSONDecoder().decode(LocationTimes.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
