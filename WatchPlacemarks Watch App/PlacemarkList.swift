//
//  PlacemarkList.swift
//  WatchPlacemarks Watch App
//
//  Created by Michael Vilabrera on 2/14/23.
//

import SwiftUI

struct PlacemarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredPlacemarks: [Placemark] {
        modelData.placemarks.filter { placemark in
            (!showFavoritesOnly || placemark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredPlacemarks) { placemark in
                    NavigationLink {
                        PlacemarkDetail(placemark: placemark)
                    } label: {
                        PlacemarksRow(placemark: placemark)
                    }
                }
            }
            .navigationTitle("Placemarks")
        }
    }
}

struct PlacemarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        PlacemarkList().environmentObject(ModelData())
    }
}
