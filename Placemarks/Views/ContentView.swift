//
//  ContentView.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlacemarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
