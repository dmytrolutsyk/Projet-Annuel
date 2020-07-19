//
//  ListingFactory.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class ListingFactory {
       
       var category: String?
       var userID: String?
       var username: String?
       var phoneNumber: String?
       var photos: String?
       var title: String?
       var listingdescription: String?
       var listingtype: String?
       var city: String?
       var createdAt: String?
       var mail: String?

    
    
    static func ListingFrom(listing: [String:Any]) -> Listing? {
        guard let id = listing["_id"] as? String,
            let category = listing["category"] as? String,
            let userID = listing["userID"] as? String,
            let username = listing["username"] as? String,
            let phoneNumber = listing["phone"] as? String,
            let photos = listing["photos"] as? String,
            let title = listing["title"] as? String,
            let listingdescription = listing["description"] as? String,
            let listingtype = listing["type"] as? String,
            let city = listing["city"] as? String,
            let createdAt = listing["createdAt"] as? String,
            let mail = listing["mail"] as? String else {
                return nil
        }
        
        
        
        
        return Listing(_id: id, category: category, userID: userID, username: username, phoneNumber: phoneNumber, photos: photos, title: title, listingdescription: listingdescription, listingtype: listingtype, city: city, createdAt: createdAt, mail: mail)
    }
    
   
    static func dictionaryFrom(listing: Listing) -> [String: Any] {
        return [
            "category": listing.category,
            "userID": "vy3ertvertv13ererb5t",
            "username": "iPad",
            "phone": "+33689654632",
            "title": listing.title ,
            "description": listing.listingdescription,
            "type": listing.listingtype,
            "city": "neuilly",
            "photos": listing.photos ,
            "createdAt": listing.createdAt ,
            "mail": "norman@gmail.com",
            "_id": "6e87r4g6et6be74tb6eebr6"
    
        ]
    }

}

