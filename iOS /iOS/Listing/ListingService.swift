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
         // guard let listingURL = URL(string: "https://findandtrade.herokuapp.com/annonces") else {
            guard let listingURL = URL(string: "https://next.json-generator.com/api/json/get/4ypKe7Whu") else {

            return;
        }
        
        let task = URLSession.shared.dataTask(with: listingURL) { (data,res,err) in

            guard let bytes = data,
            err == nil,
                
            let  json = try? JSONSerialization.jsonObject(with: bytes, options: .allowFragments) as? [Any] else {
                DispatchQueue.main.sync {
                    completion([])
                }
                    return
            }
            let Listing =  json.compactMap { (obj) -> Listing? in
                guard let listing = obj as? [String: Any] else {
                    return nil
                }
                return ListingFactory.ListingFrom(listing: listing)
            }
            DispatchQueue.main.sync {
                completion(Listing)
            }
           
        }
        task.resume()
        
    }
    
    
    func addListing(listing: Listing, completion: @escaping (Bool) -> Void) -> Void {
          // guard let listingURL = URL(string: "https://findandtrade.herokuapp.com/annonces") else {
             guard let listingURL = URL(string: "https://webhook.site/a382090f-c7b9-4522-988c-19a595fc9549") else {

               return
           }
           var request = URLRequest(url: listingURL)
           request.httpMethod = "PUT"
           request.httpBody = try? JSONSerialization.data(withJSONObject: ListingFactory.dictionaryFrom(listing: listing), options: .fragmentsAllowed)
           request.setValue("application/json", forHTTPHeaderField: "content-type")
         //  request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWNjNzI1MzdiODA4MzAwMTdjY2M4OTQiLCJ1c2VybmFtZSI6ImlwYWQiLCJwYXNzd29yZCI6IiQyYiQwNSQ4emFKUTJDbzFtNFRoR3MwZDRxTWN1YnI2bk9zYkpzYXk4QXFmZUllS1FNSGdMNjhHTHlZaSIsImlhdCI6MTU5NDIyMzQ4OSwiZXhwIjoxNTk0MzA5ODg5fQ.r1qawxlnsm2eyxHzQJTDs76GMT_TIjlERq9ZpHCD8Iw", forHTTPHeaderField: "x-access-token")

           let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, res, err) in
               if let httpRes = res as? HTTPURLResponse {
                
                completion(httpRes.statusCode == 200)
               }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                       print("data: \(dataString)")
                    completion(true)
            } else {

                completion(false)
            }
            
           })
        
           task.resume()
       }


    
}




