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
    
    let ID1 = 1
    let NAME1 = "C1"
    let ID2 = 2
    let NAME2 = "C2"
    let ID3 = 3
    let NAME3 = "C3"
    
    var gateway: CategoryGatewayProtocol = CategoryGatewayInMemory()
    
    func testGetAllCategoriesIsEmpty() {
        XCTAssertEqual(gateway.getAll().count, 0)
    }
    
    func testSaveCategory() {
        var category = CategoryModel()
        category.name = NAME1
        XCTAssertTrue(gateway.save(category))
        XCTAssertEqual(gateway.getAll().count, 1)
    }
    
    func testCategoryNameIsRequired() {
        let category = CategoryModel()
        XCTAssertFalse(gateway.save(category))
        XCTAssertEqual(gateway.getAll().count, 0)
    }
    
    func testGetById() {
        let category1 = CategoryModel(id: ID1, name: NAME1, color:"")
        gateway.save(category1)
        
        let category2 = CategoryModel(id: ID2, name: NAME2, color:"")
        gateway.save(category2)
        
        let result1 = gateway.getById(ID1)
        XCTAssertEqual(result1?.name, NAME1)
        
        let result2 = gateway.getById(ID2)
        XCTAssertEqual(result2?.name, NAME2)
    }
    
    func testFilterReturnsNothing() {
        let category1 = CategoryModel(id: ID1, name: NAME1, color:"")
        gateway.save(category1)
        
        let category2 = CategoryModel(id: ID2, name: NAME2, color:"")
        gateway.save(category2)
        
        let result = gateway.filter(NAME3)
        XCTAssertEqual(result.count, 0)
    }
    
    func testFilterReturnsOneResult() {
        let category1 = CategoryModel(id: ID1, name: NAME1, color:"")
        gateway.save(category1)
        
        let category2 = CategoryModel(id: ID2, name: NAME2, color:"")
        gateway.save(category2)
        
        let result = gateway.filter(NAME1)
        XCTAssertEqual(result.count, 1)
    }
}
