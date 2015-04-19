//
//  Group.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation

private var userGroupJoinTable:[[String: NSNumber]]!

class Group: GroupEvent {
    var name: String?
    var keywords: String?

    override var users: [User]! {
        var users: [User] = []
        for entry in userGroupJoinTable {
            if entry["group_id"] == self.id {
                if let user = User.matchingId(entry["user_id"]!) as? User {
                    users.append(user)
                }
            }
        }
        return users
    }
    
    override func getName() -> String {
        return name!
    }

    class func loadData() {
        loadGroups()
        loadUsersForGroups()
        
        for group in self.all as! [Group] {
            NSLog("\ngroup \(group.name) users \(group.users)")
        }
    }
    
    private class func loadGroups() {
        let path = NSBundle.mainBundle().pathForResource("groups", ofType: "json", inDirectory: nil)
        let groupsData = NSJSONSerialization.loadFromPath(path!, error: nil) as! [[String: AnyObject]]
        for groupData in groupsData {
            var group = Group()
            group.id = groupData["id"] as? NSNumber
            group.name = groupData["name"] as? String
            group.keywords = groupData["keywords"] as? String
            all.append(group)
        }
    }
    
    private class func loadUsersForGroups() {
        let path = NSBundle.mainBundle().pathForResource("users_groups", ofType: "json", inDirectory: nil)
        userGroupJoinTable = NSJSONSerialization.loadFromPath(path!, error: nil) as? [[String: NSNumber]]
    }

}
