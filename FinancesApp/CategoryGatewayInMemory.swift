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
    var increment = 0
    
    func getAll() -> [CategoryModel] {
        return categoryList
    }
    
    func save(var category: CategoryModel) -> Bool {
        if validate(category) {
            increment++
            category.id = increment
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
    
    func getById(id: Int) -> CategoryModel? {
        var category: CategoryModel?
        for cat in categoryList {
            if cat.id == id {
                category = cat
            }
        }
        return category
    }
    
    func generateRandomCategories(numberOfCategories: Int) {
        for index in 1...numberOfCategories {
            let category = CategoryModel(id: index, name: "\(index)", color: nil)
            categoryList += [category]
        }
    }
    
}