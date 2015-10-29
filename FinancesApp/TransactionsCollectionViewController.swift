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
}