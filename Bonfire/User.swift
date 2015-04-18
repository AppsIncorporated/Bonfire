//
//  Person.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation

class User: Entity {
    var name: String?
    var email: String?
    var image: String?
    
    class func loadData() {
        let path = NSBundle.mainBundle().pathForResource("users", ofType: "json", inDirectory: nil)
        let usersData = NSJSONSerialization.loadFromPath(path!, error: nil) as! [[String: AnyObject]]
        for userData in usersData {
            var user = User()
            user.id = userData["id"] as? NSNumber
            user.name = userData["name"] as? String
            user.email = userData["email"] as? String
            user.image = userData["image"] as? String
            //            event.start = eventData["id"]
            //            event.end = eventData["id"]
            
            all.append(user)
        }
    }
}
