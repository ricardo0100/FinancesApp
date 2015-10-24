//
//  NewCategoryTableViewController.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 24/10/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class NewCategoryTableViewController: UITableViewController {

    @IBAction func saveCategoryPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier("backToListCategoriesTableViewController", sender: sender)
    }
    
}
