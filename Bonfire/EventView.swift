//
//  EventView.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation
import UIKit

class EventView: UIView {
    @IBOutlet var personCollectionView: UICollectionView!
    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let subview = loadSubviewFromNib()
        subview.frame = bounds
        addSubview(subview)
    }
    
    private func loadSubviewFromNib() -> UIView {
        let subviews = NSBundle.mainBundle().loadNibNamed("EventView", owner: self, options: nil) as! [UIView]
        return subviews.first!
    }
    
}