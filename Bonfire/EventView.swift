//
//  EventView.swift
//  Bonfire
//
//  Created by Bao, Joseph on 4/18/15.
//  Copyright (c) 2015 John Wallace. All rights reserved.
//

import Foundation
import UIKit

class EventView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var personCollectionView: UICollectionView!
    @IBOutlet var eventNameLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let cellNib = UINib(nibName: "PersonCellView", bundle: nil)
        personCollectionView.registerNib(cellNib, forCellWithReuseIdentifier: "personCellView")
//        let flowLayout = UICollectionViewFlowLayout()
//        personCollectionView.setCollectionViewLayout(flowLayout, animated: false)

        eventNameLabel.text = "Bob's Volunteering Event"
        personCollectionView.dataSource = self
        personCollectionView.delegate = self
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
    
    //MARK: -- UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = personCollectionView.dequeueReusableCellWithReuseIdentifier("personCellView", forIndexPath: indexPath) as! PersonCellView
        cell.personImage.image = UIImage(named: "charles")
        cell.name.text = "charles barkley"
        cell.name.font = cell.name.font.fontWithSize(15)
        return cell
    }

}