//
//  CategoryModel.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

struct CategoryModel {
    
    init () {
    }
        
    init (name: String) {
        self.name = name
    }
    
    var id: Int = 0
    var name: String = ""
    var color: String?
    
}
