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
        var eventsss = Event.all as! [Event]
        eventDetailViewController.eventView.groupEvent = eventsss[indexPath.item]
        eventDetailViewController.eventView.eventNameLabel.text = "People Going"
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
        var dateString = dateFormatter.stringFromDate(events[indexPath.item].start!)
        eventDetailViewController.dateLabel.text = dateString
        navigationController?.pushViewController(eventDetailViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("eventTableViewCell") as! EventTableViewCell
        cell.eventView.groupEvent = events[indexPath.item]
        cell.eventView.eventNameLabel!.text = events[indexPath.item].name
        return cell
    }


}

