//
//  Entity.swift
//  Bonfire
//
//  Created by John Wallace on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation

private var allKey: Int = 1

class Entity: NSObject {
    var id: NSNumber?
    
    class var all: [Entity] {
        // Use associated objects bound to the class objects so that each subclass 
        // of Entity has its own 'all' array. NOTE: this binds to the leaf class, so
        // if you have a subclass of a subclass, it will have a different 'all' array
        get {
            var values = objc_getAssociatedObject(self, unsafeAddressOf(allKey)) as! [Entity]?
            if values == nil {
                values = []
                objc_setAssociatedObject(self, unsafeAddressOf(allKey), values, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
            }
            return values!
        }
        set {
            objc_setAssociatedObject(self, unsafeAddressOf(allKey), newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
    
    func getName() -> String {
        return ""
    }
    
    class func matching(matcher: (Entity)->Bool) -> [Entity] {
        var matches: [Entity] = []
        for entity in self.all {
            if matcher(entity) {
                matches.append(entity)
            }
        }
        return matches
    }
    
    class func matchingId(id: NSNumber) -> Entity? {
        return matching({ (entity: Entity) -> Bool in
            return entity.id == id;
        }).first
    }
}