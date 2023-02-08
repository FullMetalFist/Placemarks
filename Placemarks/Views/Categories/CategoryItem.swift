//
//  CategoryItem.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 2/8/23.
//

import SwiftUI

struct CategoryItem: View {
    var placemark: Placemark
    
    var body: some View {
        VStack(alignment: .leading) {
            placemark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(placemark.name).foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(placemark: ModelData().placemarks[0])
    }
}
