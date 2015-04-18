//
//  Event.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation

private var userEventJoinTable:[[String: NSNumber]]!

class Event: GroupEvent {
    var name: String?
    var address: String?
    var start: NSDate?
    var end: NSDate?
    
    override var users: [User]! {
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
        
        for event in self.all as! [Event] {
            NSLog("\nevent \(event.name) users \(event.users)")
        }
    }
    
    private class func loadEvents() {
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm'"
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT:0)

        let path = NSBundle.mainBundle().pathForResource("events", ofType: "json", inDirectory: nil)
        let eventsData = NSJSONSerialization.loadFromPath(path!, error: nil) as! [[String: AnyObject]]
        for eventData in eventsData {
            var event = Event()
            event.id = eventData["id"] as? NSNumber
            event.name = eventData["name"] as? String
            event.address = eventData["address"] as? String
            event.start = dateFormatter.dateFromString((eventData["event_start"] as? String)!)
            event.end = dateFormatter.dateFromString((eventData["event_end"] as? String)!)
            
            all.append(event)
        }
    }
    
    private class func loadUsersForEvents() {
        let path = NSBundle.mainBundle().pathForResource("users_events", ofType: "json", inDirectory: nil)
        userEventJoinTable = NSJSONSerialization.loadFromPath(path!, error: nil) as? [[String: NSNumber]]
    }
}