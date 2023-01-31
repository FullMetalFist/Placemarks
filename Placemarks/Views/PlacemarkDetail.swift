//
//  PlacemarkDetail.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/31/23.
//

import SwiftUI
import CoreLocation // remove after updating MapView

struct PlacemarkDetail: View {
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: Image("turtlerock")).offset(y: -130).padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }                        .font(.subheadline)
                    .foregroundColor(.secondary)

                Divider()
                
                Text("About Turtle Rock").font(.title2)
                Text("Descriptive text goes here")
            }
            .padding()
            Spacer()
        }
    }
}

struct PlacemarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlacemarkDetail()
    }
}
