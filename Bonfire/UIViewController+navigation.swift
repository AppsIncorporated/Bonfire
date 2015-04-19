//
//  UIViewController+navigation.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func createInstanceFromStoryboardName(storyboardName: String, storyboardId: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let instance = storyboard.instantiateViewControllerWithIdentifier(storyboardId) as! UIViewController
        
        return instance
    }
    
}