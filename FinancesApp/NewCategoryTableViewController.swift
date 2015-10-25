//
//  NewCategoryTableViewController.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 24/10/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class NewCategoryTableViewController: UITableViewController {

    //TODO: Replace gateway from View Controller to Model View Layer
    var categoryGateway: CategoryGatewayProtocol = CategoryGatewayInMemory.sharedInstance
    
    //MARK: Outlets
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    //MARK: Actions
    
    @IBAction func saveCategoryPressed(sender: UIBarButtonItem) {
        var newCategory = CategoryModel()
        newCategory.name = categoryNameTextField.text!
        
        categoryGateway.save(newCategory)

        performSegueWithIdentifier("backToListCategoriesTableViewController", sender: sender)
    }
    
}
