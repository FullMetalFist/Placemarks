//
//  NotificationController.swift
//  WatchPlacemarks Watch App
//
//  Created by Michael Vilabrera on 2/13/23.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    var placemark: Placemark?
    var title: String?
    var message: String?
    
    let placemarkIndexKey = "placemarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            placemark: placemark)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationData = notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[placemarkIndexKey] as? Int {
            placemark = modelData.placemarks[index]
        }
    }
}
