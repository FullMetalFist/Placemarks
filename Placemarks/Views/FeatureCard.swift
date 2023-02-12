//
//  FeatureCard.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 2/12/23.
//

import SwiftUI

struct FeatureCard: View {
    var placemark: Placemark
    
    var body: some View {
        placemark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(placemark: placemark)
            }
    }
}

struct TextOverlay: View {
    var placemark: Placemark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(placemark.name)
                    .font(.title)
                    .bold()
                Text(placemark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(placemark: ModelData().placemarks[0])
    }
}
