//
//  PlacemarkDetail.swift
//  WatchPlacemarks Watch App
//
//  Created by Michael Vilabrera on 2/13/23.
//

import SwiftUI

struct PlacemarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var placemark: Placemark
    
    var placemarkIndex: Int {
        modelData.placemarks.firstIndex(where: { $0.id == placemark.id })!
    }
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: placemark.image.resizable())
                    .scaledToFit()
                Text(placemark.name)
                    .font(.headline)
                    .lineLimit(0)
                Toggle(isOn: $modelData.placemarks[placemarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(placemark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(placemark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: placemark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Placemarks")
    }
}

struct PlacemarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        PlacemarkDetail(placemark: modelData.placemarks[0])
                .environmentObject(modelData)
    }
}
