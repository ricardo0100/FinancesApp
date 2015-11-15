//
//  TransactionGatewayInMemory.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 15/11/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

class TransactionGatewayInMemory {
    
    func all() -> [TransactionModel]
    {
        return []
    }
    
    func save(category: TransactionModel) -> (Bool, Int)
    {
        return (false, 0)
    }
    
    func register(with id: Int) -> TransactionModel?
    {
        return nil
    }
    
    func register(with text: String) -> [TransactionModel]
    {
        return []
    }
    
}