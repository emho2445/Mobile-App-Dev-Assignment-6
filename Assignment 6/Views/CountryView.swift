//
//  CountryView.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import SwiftUI

import Foundation

struct CountryView: View {
    let countryViewModel = CountryViewModel()
    
    
    var body: some View {
        List(countryViewModel.countries) { country in
                VStack(alignment: .leading) {
                    NavigationLink(destination: TimeDetailView(lat: String(country.latlng[0]), lng: String(country.latlng[1]))){
                        Text("\(country.name.common)")
                    }
                }
            }
        .navigationTitle("Country List")
    }
}

//struct CountriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryView()
//    }
//}

