//
//  PlacemarksApp.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/30/23.
//

import SwiftUI

@main       // main app entry point
struct PlacemarksApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            PlacemarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "PlacemarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            PlacemarkSettings()
        }
        #endif
    }
}
