//
//  Trade.swift
//  iOS
//
//  Created by Norman on 29/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class Trade: CustomStringConvertible {
    var id: Int?
    var brand: String
    var model: String
    var price: Double
    
    init(brand: String, model: String, price: Double) {
        self.brand = brand
        self.model = model
        self.price = price
    }
    
    var description: String {
        return "{\(self.id ?? 0) \(self.brand) \(self.model) \(self.price)}"
    }
}
