//
//  PlacemarkDetail.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/31/23.
//

import SwiftUI

struct PlacemarkDetail: View {
    
    var placemark: Placemark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: placemark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: placemark.image).offset(y: -130).padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(placemark.name)
                    .font(.title)
                HStack {
                    Text(placemark.park)
                    Spacer()
                    Text(placemark.state)
                }                        .font(.subheadline)
                    .foregroundColor(.secondary)

                Divider()
                
                Text("About \(placemark.name)").font(.title2)
                Text("\(placemark.description)")
            }
            .padding()
        }
        .navigationTitle(placemark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlacemarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlacemarkDetail(placemark: placemarks[0])
    }
}
