//
//  CountryView.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import SwiftUI

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

struct CountryView: View {
    @State var countries =  [Country]()
    @ObservedObject var timeViewModel: TimeViewModel
    
    func getAllCountries() async -> () {
        do {
            let url = URL(string: "https://restcountries.com/v3.1/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
            List(countries) { country in
                VStack(alignment: .leading) {
                    NavigationLink(destination: TimeDetailView(timeViewModel: timeViewModel)){
                        Text("\(country.name.common)")
                    }.simultaneousGesture(TapGesture().onEnded{
                        timeViewModel.lat = String(country.latlng[0])
                        timeViewModel.lng = String(country.latlng[1])
                    }) // We think there are issues with this modifier
                }
            }
            .task {
                await getAllCountries()
            }
        .navigationTitle("Country List")
    }
}

//struct CountriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryView()
//    }
//}

