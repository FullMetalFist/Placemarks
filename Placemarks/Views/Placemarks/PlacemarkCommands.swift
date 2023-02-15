//
//  PlacemarkCommands.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 2/14/23.
//

import SwiftUI

struct PlacemarkCommands: Commands {
    @FocusedBinding(\.selectedPlacemark) var selectedPlacemark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Placemark") {
            Button("\(selectedPlacemark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedPlacemark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedPlacemark == nil)
        }
    }
}

private struct SelectedPlacemarkKey: FocusedValueKey {
    typealias Value = Binding<Placemark>
}

extension FocusedValues {
    var selectedPlacemark: Binding<Placemark>? {
        get { self[SelectedPlacemarkKey.self] }
        set { self[SelectedPlacemarkKey.self] = newValue }
    }
}
