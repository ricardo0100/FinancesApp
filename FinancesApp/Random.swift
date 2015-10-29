//
//  RandomNumbers.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 29/10/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit
import Darwin

extension Int {
    static func random() -> Int {
        return Int(arc4random())
    }
    
    static func random(range: Range<Int>) -> Int {
        let random = Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
        return random
    }
}

extension UIColor {
    static func random() -> UIColor {
        let range = Range<Int>(start: 0, end: 255)
        
        let red = CGFloat(Double(Int.random(range)) / 255)
        let green = CGFloat(Double(Int.random(range)) / 255)
        let blue = CGFloat(Double(Int.random(range)) / 255)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}