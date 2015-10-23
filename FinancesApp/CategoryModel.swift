//
//  CategoryModel.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 10/19/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

struct CategoryModel {
    
    init() {
    }
    
    init (id: Int, name: String, color: String?) {
        self.id = id
        self.name = name
        self.color = color
    }
    
    var id: Int = 0
    var name: String = ""
    var color: String?
    
}
