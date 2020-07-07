//
//  ListingService.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

typealias ListingCompletion = ([Listing]) -> Void

class ListingService {
    
    
    func getListing(completion: @escaping ListingCompletion) -> Void {
        guard let userUrl = URL(string: "https://next.json-generator.com/api/json/get/4ypKe7Whu") else {
            return;
        }
        let task = URLSession.shared.dataTask(with: userUrl) { (data,res,err) in

            guard let bytes = data,
            err == nil,
            let  json = try? JSONSerialization.jsonObject(with: bytes, options: .allowFragments) as? [Any] else {
                DispatchQueue.main.sync {
                    completion([])
                }
                    return
            }
            print(json)
            print("help")
            let Listing =  json.compactMap { (obj) -> Listing? in
                guard let listing = obj as? [String: Any] else {
                    return nil
                }
                return ListingFactory.ListingFrom(listing: listing)
            }
            DispatchQueue.main.sync {
                completion(Listing)
            }
            print(Listing)
        }
        task.resume()
        
    }
    

    
}




