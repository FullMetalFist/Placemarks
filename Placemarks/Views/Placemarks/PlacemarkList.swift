//
//  PlacemarkList.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/31/23.
//

import SwiftUI

struct PlacemarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredPlacemarks: [Placemark] {
        modelData.placemarks.filter { placemark in
            (!showFavoritesOnly || placemark.isFavorite) && (filter == .all || filter.rawValue == placemark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Placemarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
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
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                            .pickerStyle(.inline)
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites Only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            Text("Select a Placemark")
        }
    }
}

struct PlacemarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) {
            deviceName in
            PlacemarkList().environmentObject(ModelData()).previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
        }
        
    }
}
