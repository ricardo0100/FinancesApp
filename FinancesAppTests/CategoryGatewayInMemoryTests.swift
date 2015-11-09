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
        let (result, _) = categoryGateway.save(category)
        XCTAssertTrue(result)
        XCTAssertEqual(categoryGateway.all().count, 1)
    }
    
    func testDoNotDuplicateSameIdRegisterOnSave() {
        let category1 = CategoryModel(name: NAME1)
        let (_, categoryID) = categoryGateway.save(category1)
        
        var category2 = CategoryModel(name: NAME2)
        category2.id = categoryID
        categoryGateway.save(category2)
        
        XCTAssertEqual(categoryGateway.all().count, 1)
        
        let categoryResult = categoryGateway.register(with: categoryID)
        XCTAssertEqual(NAME2, categoryResult?.name)
    }
    
    func testCategoryNameIsRequired() {
        let category = CategoryModel()
        XCTAssertFalse(categoryGateway.save(category).0)
        XCTAssertEqual(categoryGateway.all().count, 0)
    }
    
    func testGetById() {
        let category1 = CategoryModel(name: NAME1)
        let (_, id1) = categoryGateway.save(category1)
        
        let category2 = CategoryModel(name: NAME2)
        let (_, id2) = categoryGateway.save(category2)
        
        let result1 = categoryGateway.register(with: id1)
        XCTAssertEqual(result1?.name, NAME1)
        
        let result2 = categoryGateway.register(with: id2)
        XCTAssertEqual(result2?.name, NAME2)
    }
    
    func testFilterReturnsNothing() {
        let category1 = CategoryModel(name: NAME1)
        categoryGateway.save(category1)
        
        let category2 = CategoryModel(name: NAME2)
        categoryGateway.save(category2)
        
        let result = categoryGateway.register(with: NAME3)
        XCTAssertEqual(result.count, 0)
    }
    
    func testFilterReturnsOneResult() {
        let category1 = CategoryModel(name: NAME1)
        categoryGateway.save(category1)
        
        let category2 = CategoryModel(name: NAME2)
        categoryGateway.save(category2)
        
        let result = categoryGateway.register(with: NAME1)
        XCTAssertEqual(result.count, 1)
    }
    
    func testFilterReturnsTwoResults() {
        let category1 = CategoryModel(name: NAME1)
        categoryGateway.save(category1)
        
        let category2 = CategoryModel(name: NAME1)
        categoryGateway.save(category2)
        
        let result = categoryGateway.register(with: NAME1)
        XCTAssertEqual(result.count, 2)
    }
    
    func testFilterWithWhiteTextReturnsverything() {
        let category1 = CategoryModel(name: NAME1)
        categoryGateway.save(category1)

        let category2 = CategoryModel(name: NAME1)
        categoryGateway.save(category2)
        
        let result = categoryGateway.register(with: "")
        XCTAssertEqual(result.count, 2)
    }
}
