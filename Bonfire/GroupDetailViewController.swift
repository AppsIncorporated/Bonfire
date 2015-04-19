//
//  GroupDetailViewController.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/19/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation
import UIKit

class GroupDetailViewController: UIViewController {
    @IBOutlet var eventView: EventView!
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var tags: UILabel!

    
    class func createInstance() -> GroupDetailViewController {
        return createInstanceFromStoryboardName("Main", storyboardId: "groupDetailViewController") as! GroupDetailViewController
    }
}