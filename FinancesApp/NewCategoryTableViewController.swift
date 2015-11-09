//
//  NewCategoryTableViewController.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 24/10/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit
import Color_Picker_for_iOS

class NewCategoryTableViewController: UITableViewController {

    var category: CategoryModel?
    
    //TODO: Replace gateway from View Controller to Model View Layer
    var categoryGateway: CategoryGatewayProtocol = CategoryGatewayInMemory.sharedInstance
    
    //MARK: Outlets
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    //MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        if let categoryData = category {
            categoryNameTextField.text = categoryData.name
        }
    }
    
    //MARK: Actions
    
    @IBAction func saveCategoryPressed(sender: UIBarButtonItem) {
        var newCategory = CategoryModel()
        newCategory.name = categoryNameTextField.text!
        
        categoryGateway.save(newCategory)

        performSegueWithIdentifier("backToListCategoriesTableViewController", sender: sender)
    }
}
