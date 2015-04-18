//
//  NSJSONSerialization+NSData.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation

extension NSJSONSerialization {
    
    class func loadFromPath(filePath: String, error: NSErrorPointer) -> AnyObject? {
        let data = NSData(contentsOfFile:filePath)
        return NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: error)
    }
    
}