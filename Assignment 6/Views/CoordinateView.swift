//
//  SunTimeView.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import SwiftUI


struct CoordinateView: View {
    @ObservedObject var timeViewModel: TimeViewModel
    

    var body: some View {
            ZStack(content: {
                Image("Earth")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .colorInvert()
                    .frame(height: 400)
                    .opacity(0.70)
                
                VStack{
                    
                    Text("Enter a LATITUDE in the field below. This is a number between -90 and 90. You may include up to 4 decimal points")
                    TextField("Latitude", text: $timeViewModel.lat)
                    
                    Text("Enter a LONGITUDE in the field below. This is a number between -180 and 180. You may include up to 4 decimal points")
                    TextField("Longitude", text: $timeViewModel.lng)
                    
                    if timeViewModel.lat != "", timeViewModel.lng != "" {
                        NavigationLink(destination: TimeDetailView(timeViewModel: timeViewModel)){
                            Text("Search Time Details ->")
                        }
                    }
                    Spacer()
                        .frame(height: 25.0)
                    
                    Button("Clear Fields"){
                        timeViewModel.lat = ""
                        timeViewModel.lng = ""
                    }
                    
                }
                .frame(minWidth: 300, idealWidth: 300, maxWidth: 300)
            })

        .navigationTitle("Set Location")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        
        
    }
}

//struct CoordinateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoordinateView()
//    }
//}
