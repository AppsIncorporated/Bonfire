//
//  EventDetailViewController.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation
import UIKit

class EventDetailViewController: UIViewController {
    @IBOutlet var eventView: EventView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var eventTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: nil)
    }
    
    class func createInstance() -> EventDetailViewController {
        return createInstanceFromStoryboardName("Main", storyboardId: "eventDetailViewController") as! EventDetailViewController
    }
}