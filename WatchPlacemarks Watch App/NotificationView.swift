//
//  NotificationView.swift
//  WatchPlacemarks Watch App
//
//  Created by Michael Vilabrera on 2/13/23.
//

import SwiftUI

struct NotificationView: View {
    
    var title: String?
    var message: String?
    var placemark: Placemark?
    
    var body: some View {
        VStack {
            if placemark != nil {
                CircleImage(image: placemark!.image.resizable()).scaledToFit()
            }
            
            Text(title ?? "Unknown Placemark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "Default Message")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock", message: "You are within 5 miles", placemark: ModelData().placemarks[0])
        }
    }
}
