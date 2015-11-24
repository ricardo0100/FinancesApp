//
//  FinancesAppTests.swift
//  FinancesAppTests
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
@testable import FinancesApp

class CategoryGatewayInMemoryTests: XCTestCase {
    
    let NAME1 = "C1"
    let NAME2 = "C2"
    let NAME3 = "C3"
    
    var categoryGateway: CategoryGatewayProtocol = CategoryGatewayInMemory()
    
    func testGetAllCategoriesIsEmpty() {
        XCTAssertEqual(categoryGateway.all().count, 0)
    }
    
    func testSaveCategory() {
        var category = CategoryModel()
        category.name = NAME1
        let result = categoryGateway.save(&category)
        XCTAssertTrue(result)
        XCTAssertEqual(categoryGateway.all().count, 1)
    }
    
    func testDoNotDuplicateSameIdRegisterOnSave() {
        var category1 = CategoryModel(name: NAME1)
        categoryGateway.save(&category1)
        let categoryID = category1.id
        
        var category2 = CategoryModel(name: NAME2)
        category2.id = categoryID
        categoryGateway.save(&category2)
        
        XCTAssertEqual(categoryGateway.all().count, 1)
        
        let categoryResult = categoryGateway.register(with: categoryID)
        XCTAssertEqual(NAME2, categoryResult?.name)
    }
    
    func testCategoryNameIsRequired() {
        var category = CategoryModel()
        XCTAssertFalse(categoryGateway.save(&category))
        XCTAssertEqual(categoryGateway.all().count, 0)
    }
    
    func testGetById() {
        var category1 = CategoryModel(name: NAME1)
        categoryGateway.save(&category1)
        
        var category2 = CategoryModel(name: NAME2)
        categoryGateway.save(&category2)
        
        let result1 = categoryGateway.register(with: category1.id)
        XCTAssertEqual(result1?.name, NAME1)
        
        let result2 = categoryGateway.register(with: category2.id)
        XCTAssertEqual(result2?.name, NAME2)
    }
    
    func testFilterReturnsNothing() {
        var category1 = CategoryModel(name: NAME1)
        categoryGateway.save(&category1)
        
        var category2 = CategoryModel(name: NAME2)
        categoryGateway.save(&category2)
        
        let result = categoryGateway.register(with: NAME3)
        XCTAssertEqual(result.count, 0)
    }
    
    func testFilterReturnsOneResult() {
        var category1 = CategoryModel(name: NAME1)
        categoryGateway.save(&category1)
        
        var category2 = CategoryModel(name: NAME2)
        categoryGateway.save(&category2)
        
        let result = categoryGateway.register(with: NAME1)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterReturnsTwoResults() {
        var category1 = CategoryModel(name: NAME1)
        categoryGateway.save(&category1)
        
        var category2 = CategoryModel(name: NAME1)
        categoryGateway.save(&category2)
        
        let result = categoryGateway.register(with: NAME1)
        XCTAssertEqual(result.count, 2)
    }
    
    func testFilterWithWhiteTextReturnsverything() {
        var category1 = CategoryModel(name: NAME1)
        categoryGateway.save(&category1)

        var category2 = CategoryModel(name: NAME1)
        categoryGateway.save(&category2)
        
        let result = categoryGateway.register(with: "")
        XCTAssertEqual(result.count, 2)
    }
    
    func testIfCategoryIsNewReturnsTrue() {
        let category = CategoryModel(name: NAME1)
        
        XCTAssertTrue(category.isNew())
    }
    
    func testIfCategoryIsNewReturnsFalse() {
        var category = CategoryModel(name: NAME1)
        categoryGateway.save(&category)
        
        XCTAssertFalse(category.isNew())
    }
    
}
