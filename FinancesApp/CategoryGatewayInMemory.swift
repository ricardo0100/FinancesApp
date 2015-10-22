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
    
    // MARK: Init

    init() {
    }
    
    init(with numberOfRandomWords: Int) {
        generateRandomCategories(numberOfRandomWords)
    }
    
    // MARK: - GatewayProtocol Implementation
    
    func all() -> [CategoryModel] {
        return categoryList
    }
    
    func save(category: CategoryModel) -> Bool {
        var register = category
        if validate(register) {
            increment++
            register.id = increment
            categoryList.append(register)
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
    
    func register(with id: Int) -> CategoryModel? {
        var category: CategoryModel?
        for cat in categoryList {
            if cat.id == id {
                category = cat
            }
        }
        return category
    }
    
    func register(with text: String) -> [CategoryModel] {
        var filteredList: [CategoryModel] = []
        
        for cat in categoryList {
            if cat.name.containsString(text) {
                filteredList.append(cat)
            }
        }
        
        return filteredList
    }
    
    // MARK: - Random Categories
    
    let randomWords = ["Here's", "what", "this", "looks", "like", "when", "running", "Notice", "that", "unlike", "in", "the", "search", "display", "controller", "example", "we", "are", "using", "the", "same", "table", "view", "to", "display", "the", "search", "results", "instead", "of", "overlaying", "of", "a", "separate", "table", "view", "However", "unlike", "when", "working", "with", "just", "the", "search", "bar", "we", "still", "have", "the", "built", "in", "animation", "when", "transitioning", "to", "the", "search", "interface"]
    
    func randomInt(min min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    func randomWord() -> String {
        let numberOfAvailableRandomWords = randomWords.count
        let diceRoll = randomInt(min: 0, max: numberOfAvailableRandomWords - 1)
        
        return randomWords[diceRoll]
    }
    
    func generateRandomCategories(numberOfCategories: Int) {
        for index in 1...numberOfCategories {
            let category = CategoryModel(id: index, name: randomWord(), color: nil)
            categoryList += [category]
        }
    }
    
}