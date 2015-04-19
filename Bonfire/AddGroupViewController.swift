//
//  AddGroupViewController.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/19/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation
import UIKit

class AddGroupViewController: UIViewController {
    @IBOutlet var name: UITextField!
    @IBOutlet var location: UITextField!
    @IBOutlet var descrip: UITextView!
    @IBOutlet var tags: UILabel!
    @IBOutlet var insert: UITextField!
    @IBOutlet var add: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Invite", style: UIBarButtonItemStyle.Plain, target: self, action: "isDone:")
    }
    
    class func createInstance() -> AddGroupViewController {
        return createInstanceFromStoryboardName("Main", storyboardId: "addGroupViewController") as! AddGroupViewController
    }
    
    func isDone(sender: AnyObject) {
        var groupInviteViewController = GroupInviteViewController.createInstance()
        groupInviteViewController.entities = User.all
        self.navigationController?.pushViewController(groupInviteViewController, animated: true)
    }

    @IBAction func clicked(sender: AnyObject) {
        tags.text! += " " + insert.text + ","
        insert.text = ""
    }
}
