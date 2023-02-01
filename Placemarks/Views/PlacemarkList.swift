//
//  PlacemarkList.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/31/23.
//

import SwiftUI

struct PlacemarkList: View {
    var body: some View {
        NavigationView {
            List(placemarks) { placemark in
                NavigationLink {
                    PlacemarkDetail(placemark: placemark)
                } label: {
                    PlacemarksRow(placemark: placemark)
                }
            }
            .navigationTitle("Placemarks")
        }
    }
}

struct PlacemarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) {
            deviceName in
            PlacemarkList().previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
        }
        
    }
}
