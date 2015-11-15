//
//  TransactionGatewayInMemoryTests.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 11/11/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

import XCTest
@testable import FinancesApp

class TransactionGatewayInMemoryTests: XCTestCase {
    
    var transactionGateway: TransactionGatewayInMemory = TransactionGatewayInMemory()
    
    func testGetAllTransactionsIsEmpty() {
        XCTAssertEqual(transactionGateway.all().count, 0)
    }
    
}