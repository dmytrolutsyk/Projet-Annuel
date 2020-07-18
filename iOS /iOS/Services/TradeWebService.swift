//
//  TradeWebService.swift
//  iOS
//
//  Created by Norman on 29/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class TradeWebService {


func getTrades(completion: @escaping ([Trade]) -> Void) -> Void {
    guard let tradeURL = URL(string: "https://moc-3a-movies.herokuapp.com/") else {
        return;
    }
    let task = URLSession.shared.dataTask(with: tradeURL, completionHandler: { (data: Data?, res, err) in
        guard let bytes = data,
              err == nil,
            let json = try? JSONSerialization.jsonObject(with: bytes, options: .allowFragments) as? [String: Any] else {
                DispatchQueue.main.sync {
                    completion([])
                }
            return
        }
        let trades = json.compactMap { (obj) -> Trade? in
            guard let dict = obj as? [String: Any] else {
                return nil
            }
            return TradeFactory.tradeFrom(dictionary: dict)
        }
        DispatchQueue.main.sync {
            completion(trades)
        }
    })
    task.resume()
}

}
