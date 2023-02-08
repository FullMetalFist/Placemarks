//
//  ContentView.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome().tabItem {
                Label("Featured", systemImage: "star")
            }
            .tag(Tab.featured)
            
            PlacemarkList().tabItem {
                Label("Item", systemImage: "list.bullet")
            }
            .tag(Tab.list)
        }
        PlacemarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
