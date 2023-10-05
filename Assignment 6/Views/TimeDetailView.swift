//
//  TimeDetailView.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import SwiftUI

struct TimeDetailView: View {
    @ObservedObject var timeViewModel: TimeViewModel
    
    var body: some View {
        ZStack(content: {
            Image("Earth")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .colorInvert()
                .frame(height: 300)
                .opacity(0.70)
            VStack{
                Text("Lat: \(timeViewModel.lat), Long: \(timeViewModel.lng)")
                    .task {
                        await timeViewModel.getSunTimes()
                    }
                if let existingLocationTimes = timeViewModel.locationTimes{
                    Text("Sunrise: \(existingLocationTimes.results.sunrise)")
                    Text("Sunset: \(existingLocationTimes.results.sunset)")
                    Text("Solar Noon: \(existingLocationTimes.results.solar_noon)")
                    Text("Day Length: \(existingLocationTimes.results.day_length)")
                    
                    Group{
                        Text("Civil Twilight Start: \(existingLocationTimes.results.civil_twilight_begin)")
                        Text("Civil Twilight End: \(existingLocationTimes.results.civil_twilight_end)")
                        Text("Nautical Twilight Start: \(existingLocationTimes.results.nautical_twilight_begin)")
                        Text("Nautical Twilight End: \(existingLocationTimes.results.nautical_twilight_end)")
                        Text("Astronomical Twilight Start: \(existingLocationTimes.results.astronomical_twilight_begin)")
                        Text("Astronomical Twilight End: \(existingLocationTimes.results.astronomical_twilight_end)")
                    }
                }
                
            }
            
        })
        
        .navigationTitle("")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        
    }
}

//struct TimeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeDetailView(timeViewModel: TimeViewModel)
//    }
//}
