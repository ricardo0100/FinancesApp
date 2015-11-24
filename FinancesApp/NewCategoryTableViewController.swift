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

    var category: CategoryModel = CategoryModel()
    
    //TODO: Replace gateway from View Controller to Model View Layer
    var categoryGateway: CategoryGatewayProtocol = CategoryGatewayInMemory.sharedInstance
    
    //MARK: Outlets
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    //MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewDidDisappear(animated: Bool) {
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    func loadData() {
        categoryNameTextField.text = category.name
        
        navigationController?.setToolbarHidden(category.isNew(), animated: true)
    }
    
    //MARK: Actions
    
    @IBAction func saveCategoryPressed(sender: UIBarButtonItem) {
        category.name = categoryNameTextField.text!
        
        categoryGateway.save(&category)

        performSegueWithIdentifier("backToListCategoriesTableViewController", sender: sender)
    }
    
    @IBAction func deleteCategoryPressed(sender: AnyObject) {
        print("HEY")
    }
}
