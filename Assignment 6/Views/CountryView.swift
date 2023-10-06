//
//  CountryView.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import SwiftUI

import Foundation

struct CountryView: View {
    @ObservedObject var countries: CountryViewModel
    @ObservedObject var timeViewModel: TimeViewModel
    
    
    var body: some View {
        List(countries.countries) { country in
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
                await countries.getAllCountries()
            }
        .navigationTitle("Country List")
    }
}

//struct CountriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryView()
//    }
//}

