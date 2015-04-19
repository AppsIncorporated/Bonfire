//
//  CreateEventView.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/19/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation
import UIKit

class CreateEventViewController: UIViewController {
    @IBOutlet var eventName: UITextField!
    @IBOutlet var venue: UITextField!
    @IBOutlet var date: UILabel!
    @IBOutlet var endDate: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    
    class func createInstance() -> CreateEventViewController {
        return createInstanceFromStoryboardName("Main", storyboardId: "createEventViewController") as! CreateEventViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                self.navigationItem.title = "New Event"
        var doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "finishedThis:")
        self.navigationItem.rightBarButtonItem = doneButton
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        endDatePicker.addTarget(self, action: Selector("endDatePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)

    }
    
    func endDatePickerChanged(datePicker: UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        endDate.text = "End: \(strDate)"
    }
    
    func datePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        endDatePicker.date = datePicker.date
        date.text = "Start: \(strDate)"
    }
    
    func finishedThis(sender: AnyObject) {
        var groupInviteViewController = GroupInviteViewController.createInstance()
        groupInviteViewController.entities = Group.all + User.all
        self.navigationController?.pushViewController(groupInviteViewController, animated: true)
    }
}