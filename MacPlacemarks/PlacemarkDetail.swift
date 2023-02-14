//
//  PlacemarkDetail.swift
//  MacPlacemarks
//
//  Created by Michael Vilabrera on 2/14/23.
//

import SwiftUI
import MapKit

struct PlacemarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var placemark: Placemark
    
    var placemarkIndex: Int {
        modelData.placemarks.firstIndex(where: { $0.id == placemark.id })!
    }
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: placemark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: placemark.locationCoordinate))
                    destination.name = placemark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: placemark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(placemark.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.placemarks[placemarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack {
                            Text(placemark.park)
                            Text(placemark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        
                    }
                }
                Divider()
                
                Text("About \(placemark.name)")
                    .font(.title2)
                Text(placemark.description)
            }
            .padding()
            .offset(y: -50)
        }
        .navigationTitle(placemark.name)
    }
}

struct PlacemarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        PlacemarkDetail(placemark: modelData.placemarks[0])
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
    }
}
