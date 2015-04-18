//
//  Person.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import UIKit

class User: Entity {
    var name: String?
    var email: String?
    var image: UIImage?
    
    class func loadData() {
        let path = NSBundle.mainBundle().pathForResource("users", ofType: "json", inDirectory: nil)
        let usersData = NSJSONSerialization.loadFromPath(path!, error: nil) as! [[String: AnyObject]]
        for userData in usersData {
            var user = User()
            user.id = userData["id"] as? NSNumber
            user.name = userData["name"] as? String
            user.email = userData["email"] as? String
            user.image = UIImage(named: (userData["image"] as? String)!)
            
            all.append(user)
        }
    }
}
