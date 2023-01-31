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
            Text(placemark.name)
            Spacer()
        }
    }
}

struct PlacemarksRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlacemarksRow(placemark: placemarks[0])
            PlacemarksRow(placemark: placemarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

        
    }
}
