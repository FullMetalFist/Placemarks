//
//  CategoryRow.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 2/8/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Placemark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { placemark in
                        CategoryItem(placemark: placemark)
                    }
                }
            }.frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var placemarks = ModelData().placemarks
    static var previews: some View {
        CategoryRow(categoryName: placemarks[0].category.rawValue, items: Array(placemarks.prefix(4)))
    }
}
