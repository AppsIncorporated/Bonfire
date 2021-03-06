//
//  FirstViewController.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    var events: [Event]!
    var arrayedEvents: [[Event]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cellNib = UINib(nibName: "EventTableViewCell", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: "eventTableViewCell")
        events = Event.all as! [Event]
//        var numArray: [NSInteger] = [0,0,0,0]
//        for var i = 0; i < events.count; i++ {
//            var section = i%4
//            arrayedEvents[section][numArray[section]] = events[i]
//            numArray[section]++
//        }
        self.navigationItem.title = "Events"
        var searchButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: "searchAndFilterPage:")
        var addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "add:")
        self.navigationItem.rightBarButtonItems = [searchButton, addButton]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Mine", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
    }
    
    func add(sender: AnyObject) {
        let createEventViewController = CreateEventViewController.createInstance()
        navigationController?.pushViewController(createEventViewController, animated: true)
    }
    
    func searchAndFilterPage() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let eventDetailViewController = EventDetailViewController.createInstance()
        let view = eventDetailViewController.view
        var eventsss = Event.all as! [Event]
        eventDetailViewController.eventView.groupEvent = eventsss[indexPath.item]
        eventDetailViewController.eventView.eventNameLabel.text = "People Going"
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd hh:mm" //format style. Browse online to get a format that fits your needs.
        var dateString = dateFormatter.stringFromDate(events[indexPath.item].start!)
        eventDetailViewController.dateLabel.text = "When: April \(dateString) pm"
        eventDetailViewController.eventTitle.text = eventsss[indexPath.item].name
        navigationController?.pushViewController(eventDetailViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("eventTableViewCell") as! EventTableViewCell
        cell.eventView.groupEvent = events[indexPath.item]
        cell.eventView.eventNameLabel!.text = events[indexPath.item].name
        return cell
    }


}

