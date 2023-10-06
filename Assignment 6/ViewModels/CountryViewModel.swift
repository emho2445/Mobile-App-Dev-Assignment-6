//
//  CountryViewModel.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/5/23.
//

import Foundation

class CountryViewModel: ObservableObject {
    
    @Published var countries = [Country]()
    
    init() {
        Task {
            await getAllCountries()
        }
    }
    
    @MainActor
    func getAllCountries() async -> () {
        do {
            let url = URL(string: "https://restcountries.com/v3.1/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
                countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
