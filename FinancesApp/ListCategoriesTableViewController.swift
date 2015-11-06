//
//  ListCategoriesTableViewController.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class ListCategoriesTableViewController: UITableViewController, UISearchResultsUpdating {
    
    let cellIdentificator = "CategoryCell"
    
    //TODO: Replace gateway from View Controller to Model View Layer
    var categoryGateway: CategoryGatewayProtocol = CategoryGatewayInMemory.sharedInstance
    var categoryList: [CategoryModel]?
    
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryList = categoryGateway.all()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()

        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = categoryList {
            return list.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let category = categoryList![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentificator, forIndexPath: indexPath)
        cell.textLabel?.text = category.name

        return cell
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        categoryList = categoryGateway.register(with: searchText!)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Edit Category" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let viewController = navigationController.viewControllers[0] as! NewCategoryTableViewController
            
            let indexPath = tableView.indexPathForCell((sender as! UITableViewCell))
            let category = categoryList![indexPath!.row]
            
            viewController.category = category
        }
    }
    
    //MARK: Unwind Segues
    
    @IBAction func backToListCategoriesTableViewController(segue:UIStoryboardSegue) {
        categoryList = categoryGateway.all()
        tableView.reloadData()
    }
    
}
