//
//  TradeFactory.swift
//  iOS
//
//  Created by Norman on 29/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class TradeFactory {
    
    static func tradeFrom(dictionary: [String: Any]) -> Trade? {
        guard let b = dictionary["brand"] as? String,
              let m = dictionary["model"] as? String,
              let p = dictionary["price"] as? Double else {
                return nil
        }
        let trade = Trade(brand: b, model: m, price: p)
        trade.id = dictionary["id"] as? Int
        return trade
    }
    
    static func dictionaryFrom(trade: Trade) -> [String: Any] {
        return [
            "brand": trade.brand,
            "model": trade.model,
            "price": trade.price
        ]
    }
    
}
