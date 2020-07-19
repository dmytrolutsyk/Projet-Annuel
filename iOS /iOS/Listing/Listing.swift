//
//  Listing.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class Listing: CustomStringConvertible {
 
    
    var _id: String?
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


    
    init(category: String?, userID: String?, username: String?, phoneNumber: String?, photos: String?, title: String?, listingdescription: String?, listingtype: String?, city: String?, createdAt: String?, mail: String?) {
        
        
        self.category = category
        self.userID = userID
        self.username = username
        self.phoneNumber = phoneNumber
        self.photos = photos
        self.title = title
        self.listingdescription = listingdescription
        self.listingtype = listingtype
        self.city = city
        self.createdAt = createdAt
        self.mail = mail
    }
    
    convenience init(_id: String?,category: String?, userID: String?, username: String?, phoneNumber: String?, photos: String?, title: String?, listingdescription: String?, listingtype: String?, city: String?, createdAt: String?, mail: String?) {
        self.init(category: category, userID: userID, username: username, phoneNumber: phoneNumber, photos: photos, title: title, listingdescription: listingdescription, listingtype: listingtype, city: city, createdAt: createdAt, mail: mail)
         self._id = _id
         self.category = category
         self.userID = userID
         self.username = username
         self.phoneNumber = phoneNumber
         self.photos = photos
         self.title = title
         self.listingdescription = listingdescription
         self.listingtype = listingtype
         self.city = city
         self.createdAt = createdAt
         self.mail = mail
     }
    
 
    
    var description: String {
    return "{ category: \(self.category ), userID: \(self.userID), username: \(self.username), phoneNumber: \(self.phoneNumber), photos: \(self.photos), title: \(self.title), listingdescription: \(self.listingdescription),  listingtype: \(self.listingtype), city: \(self.city), createdAt: \(self.createdAt), mail: \(self.mail)}"
    }
}
