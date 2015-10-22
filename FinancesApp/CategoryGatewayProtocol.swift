//
//  CategoryGateway.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol CategoryGatewayProtocol {
    
    func all() -> [CategoryModel]
    func save(category: CategoryModel) -> Bool
    func register(with id: Int) -> CategoryModel?
    func register(with text: String) -> [CategoryModel]
    
}