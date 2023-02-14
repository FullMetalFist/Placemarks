//
//  PlacemarksRow.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/30/23.
//

import SwiftUI

struct PlacemarksRow: View {
    var placemark: Placemark
    
    
    var body: some View {
        HStack {
            placemark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(placemark.name)
                    .bold()
                #if !os(watchOS)
                Text(placemark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }
            
            Spacer()
            
            if placemark.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct PlacemarksRow_Previews: PreviewProvider {
    
    static var placemarks = ModelData().placemarks
    static var previews: some View {
        Group {
            PlacemarksRow(placemark: placemarks[0])
            PlacemarksRow(placemark: placemarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

        
    }
}
