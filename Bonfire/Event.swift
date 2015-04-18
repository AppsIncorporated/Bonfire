//
//  Event.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation

private var userEventJoinTable:[[String: NSNumber]]!

class Event: Entity {
    var name: String?
    var address: String?
    var start: NSDate?
    var end: NSDate?
    
    var attendees: [User]? {
        var users: [User] = []
        for entry in userEventJoinTable {
            if entry["event_id"] == self.id {
                if let user = User.matchingId(entry["user_id"]!) as? User {
                    users.append(user)
                }
            }
        }
        return users
    }
        
    class func loadData() {
        loadEvents()
        loadUsersForEvents()
        
//        for event in self.all as! [Event] {
//            NSLog("event \(event.name) users \(event.attendees)")
//        }
    }
    
    private class func loadEvents() {
        let path = NSBundle.mainBundle().pathForResource("events", ofType: "json", inDirectory: nil)
        let eventsData = NSJSONSerialization.loadFromPath(path!, error: nil) as! [[String: AnyObject]]
        for eventData in eventsData {
            var event = Event()
            event.id = eventData["id"] as? NSNumber
            event.name = eventData["name"] as? String
            event.address = eventData["address"] as? String
//            event.start = eventData["id"]
//            event.end = eventData["id"]
            
            all.append(event)
        }
    }
    
    private class func loadUsersForEvents() {
        let path = NSBundle.mainBundle().pathForResource("users_events", ofType: "json", inDirectory: nil)
        userEventJoinTable = NSJSONSerialization.loadFromPath(path!, error: nil) as? [[String: NSNumber]]
    }
}