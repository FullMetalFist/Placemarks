//
//  PlacemarkSettings.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 2/15/23.
//

import SwiftUI

struct PlacemarkSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Placemark Settings")
        .padding(80)
    }
}

struct PlacemarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        PlacemarkSettings()
    }
}
