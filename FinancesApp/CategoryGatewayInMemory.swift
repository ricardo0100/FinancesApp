//
//  CategoryGatewayInMemory.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

class CategoryGatewayInMemory: CategoryGatewayProtocol {
    
    static let sharedInstance = CategoryGatewayInMemory(withExamples: true)
    
    var categoryList = [Int: CategoryModel]()
    var increment = 0
    
    // MARK: Init

    init() {
    }

    init(withExamples showExamples: Bool) {
        if showExamples {
            generateExampleCategories()
        }
    }
    
    init(with numberOfRandomWords: Int) {
        generateRandomCategories(numberOfRandomWords)
    }
    
    // MARK: - GatewayProtocol Implementation
    
    func all() -> [CategoryModel] {
        return [CategoryModel](categoryList.values)
    }
    
    func save(inout category: CategoryModel) -> Bool {
        if validate(category) {
            if categoryList.keys.contains(category.id) {
                categoryList[category.id] = category
            } else {
                increment += 1
                category.id = increment
                categoryList[category.id] = category
            }
            return true
        } else {
            return false
        }
    }
    
    // TODO: Validation should not live in the gateway, maybe a usecase/viewmodel
    func validate(category: CategoryModel) -> Bool {
        if category.name.isEmpty {
            return false
        }
        return true
    }
    
    func register(with id: Int) -> CategoryModel? {
        if !categoryList.keys.contains(id) {
            return nil
        }
        
        return categoryList[id]
    }
    
    func register(with text: String) -> [CategoryModel] {
        if text.isEmpty {
            return all()
        }
        
        var filteredList: [CategoryModel] = []
        
        for (_, cat) in categoryList {
            if cat.name.containsString(text) {
                filteredList.append(cat)
            }
        }
        
        return filteredList
    }
    
    //MARK: Example Categories
    
    let exampleCategories = ["Restaurant", "Transportation", "Health", "Party"]
    
    func generateExampleCategories() {
        for index in 0..<exampleCategories.count {
            let name = exampleCategories[index]
            var category = CategoryModel(name: name)
            save(&category)
        }
    }
    
    //MARK: Random Categories
    
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
        for _ in 0..<numberOfCategories {
            var category = CategoryModel(name: randomWord())
            save(&category)
        }
    }
    
}