//
//  ContentView.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timeViewModel = TimeViewModel()
    
    var body: some View {
        NavigationView{
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
                    Text("Explore sunrise and sunset times at different locations around the world.")
                        .font(.title)
                        .frame(minWidth: 300, idealWidth: 300, maxWidth: 300)
                    Spacer()
                        .frame(height: 50.0)
                    NavigationLink("Explore by Coordinates ->"){
                        CoordinateView(timeViewModel: timeViewModel)
                    }
                    Spacer()
                        .frame(height: 25.0)
                    NavigationLink("Explore by Country ->"){
                        CountryView(timeViewModel: timeViewModel)
                    }
                }

            })
            
        }
        .navigationTitle("")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
