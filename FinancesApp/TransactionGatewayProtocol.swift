//
//  TransactionGatewayProtocol.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 15/11/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol TransactionGatewayProtocol {
    
    func all() -> [TransactionModel]
    func save(category: TransactionModel) -> (Bool, Int)
    func register(with id: Int) -> TransactionModel?
    func register(with text: String) -> [TransactionModel]
    
}