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
    let numberOfWords: Int = 50
    
    var categoryGateway: CategoryGatewayProtocol!
    var categoryList: [CategoryModel]?
    
    var searchController: UISearchController!
    var categorySearchTableViewController: CategorySearchTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryGateway = CategoryGatewayInMemory(with: numberOfWords)
        categorySearchTableViewController = CategorySearchTableViewController()
        searchController = UISearchController(searchResultsController: categorySearchTableViewController)
        
        categoryList = categoryGateway.all()
        
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
