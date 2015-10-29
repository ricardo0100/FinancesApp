//
//  TransactionsCollectionViewController.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 29/10/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class TransactionsCollectionViewController: UICollectionViewController {

    let reuseIdentifier = "TransactionCell"
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 500
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.random()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = Int.random(Range(start: 10, end: 200))
        let height = Int.random(Range(start: 10, end: 200))
        return CGSize(width: width, height: height)
    }
}