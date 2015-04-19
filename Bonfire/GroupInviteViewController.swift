//
//  GroupInviteViewController.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/19/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation
import UIKit

class GroupInviteViewController: UITableViewController {
    
    var entities: [Entity]!
    var checkedEntities: [Bool]!
    
    class func createInstance() -> GroupInviteViewController {
        return createInstanceFromStoryboardName("Main", storyboardId: "groupInviteViewController") as! GroupInviteViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkedEntities = [Bool]()
        for (var i = 0; i < entities.count; i++) {
            checkedEntities.append(false)
        }
        let cellNib = UINib(nibName: "GroupInvite", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: "groupInvite")
        var invite = UIBarButtonItem(title: "Invite", style: UIBarButtonItemStyle.Plain, target: self, action: "done:")
        self.navigationItem.rightBarButtonItem = invite
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func done(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if checkedEntities[indexPath.item] {
            checkedEntities[indexPath.item] = false
            tableView.reloadData()
        }
        else{
            checkedEntities[indexPath.item] = true
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("groupInvite") as! GroupInvite
        cell.name.text = entities[indexPath.item].getName()
        if (!checkedEntities[indexPath.row]) {
            cell.check.hidden = true
        }
        else {
            cell.check.hidden = false
        }
        return cell
    }
}