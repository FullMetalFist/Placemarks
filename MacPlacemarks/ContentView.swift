//
//  ContentView.swift
//  MacPlacemarks
//
//  Created by Michael Vilabrera on 2/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PlacemarkList().frame(minWidth: 700, minHeight: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
