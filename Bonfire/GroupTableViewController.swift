//
//  SecondViewController.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    var groups: [Group]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cellNib = UINib(nibName: "EventTableViewCell", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: "eventTableViewCell")
        groups = Group.all as! [Group]
        self.navigationItem.title = "Groups"
        var searchButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: "searchAndFilterPage:")
        var addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "add:")
        self.navigationItem.rightBarButtonItems = [searchButton, addButton]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Mine", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func add(sender: AnyObject) {
        var addGroupViewController = AddGroupViewController.createInstance()
        self.navigationController?.pushViewController(addGroupViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let groupDetailViewController = GroupDetailViewController.createInstance()
        let view = groupDetailViewController.view
        var eventsss = Group.all as! [Group]
        groupDetailViewController.eventView.groupEvent = eventsss[indexPath.item]
        groupDetailViewController.eventView.eventNameLabel.text = "Members"
        if  let b = eventsss[indexPath.item].keywords {
            if (b.isEmpty) {
                groupDetailViewController.tags.text = "Tags: None"
            }
            else{
                groupDetailViewController.tags.text = "Tags: \(eventsss[indexPath.item].keywords!)"
            }
        }
        else {
            groupDetailViewController.tags.text = "Tags: None"
        }
        groupDetailViewController.eventTitle.text = eventsss[indexPath.item].name
        navigationController?.pushViewController(groupDetailViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("eventTableViewCell") as! EventTableViewCell
        cell.eventView.groupEvent = groups[indexPath.item]
        cell.eventView.eventNameLabel.text = groups[indexPath.item].name
        return cell
    }


}

