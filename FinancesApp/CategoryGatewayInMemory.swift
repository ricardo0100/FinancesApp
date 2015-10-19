//
//  CategoryGatewayInMemory.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

class CategoryGatewayInMemory: CategoryGatewayProtocol {
    
    var categoryList = [CategoryModel]()
    
    func getAll() -> [CategoryModel] {
        return categoryList
    }
    
    func save(category: CategoryModel) -> Bool {
        if validate(category) {
            categoryList.append(category)
            return true
        } else {
            return false
        }
    }
    
    func validate(category: CategoryModel) -> Bool {
        if category.name.isEmpty {
            return false
        }
        return true
    }
}