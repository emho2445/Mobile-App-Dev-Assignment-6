//
//  MapView.swift
//  Assignment 6
//
//  Created by Emma  Hopson on 10/12/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    let lat: Double
    let lng: Double
    
    
    var body: some View {
        
        Map() {
            Marker("Latitude: \(lat), Longitude: \(lng)", systemImage: "mappin.and.ellipse", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
        }
        .mapStyle(.imagery(elevation: .realistic))
        .mapControls {
            //MapUserLocationButton()
            MapCompass()
            MapScaleView()
            MapPitchToggle()
        }
    }
}

