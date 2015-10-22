//
//  ListCategoriesTableViewController.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class ListCategoriesTableViewController: UITableViewController {
    
    let CellIdentificator = "CategoryCell"
    
    var categoryGateway = CategoryGatewayInMemory()
    var categoryList: [CategoryModel]?
    
    var searchController: UISearchController!
    var categorySearchTableViewController: CategorySearchTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryGateway.generateRandomCategories(50)
        categoryList = categoryGateway.getAll()
        
        categorySearchTableViewController = CategorySearchTableViewController()
        searchController = UISearchController(searchResultsController: categorySearchTableViewController)
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = categoryList {
            return list.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let category = categoryList![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentificator, forIndexPath: indexPath)
        cell.textLabel?.text = category.name
        return cell
    }
    
}
