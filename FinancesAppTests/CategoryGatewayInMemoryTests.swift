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
    
    var gateway: CategoryGatewayProtocol = CategoryGatewayInMemory()
    
    func testGetAllCategoriesIsEmpty() {
        XCTAssertEqual(gateway.getAll().count, 0)
    }
    
    func testSaveCategory() {
        var category = CategoryModel()
        category.name = "Hey"
        XCTAssertTrue(gateway.save(category))
        XCTAssertEqual(gateway.getAll().count, 1)
    }
    
    func testCategoryNameIsRequired() {
        let category = CategoryModel()
        XCTAssertFalse(gateway.save(category))
        XCTAssertEqual(gateway.getAll().count, 0)
    }
    
}
