//
//  ListingFactory.swift
//  iOS
//
//  Created by Norman on 02/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class ListingFactory {
       
       var idCategory: String?
       var idUser: String?
       var pseudo: String?
       var idVolunteer: String?
       var photoPath: String?
       var title: String?
       var Listingdescription: String?
       var status: Int?
       var createAt: String?
    
    
    static func ListingFrom(listing: [String:Any]) -> Listing? {
        guard let id = listing["_id"] as? String,
            let idCategory = listing["idCategory"] as? String,
            let idUser = listing["idUser"] as? String,
            let pseudo = listing["pseudo"] as? String,
            let idVolunteer = listing["idVolunteer"] as? String,
            let photoPath = listing["photoPath"] as? String,
            let title = listing["title"] as? String,
            let Listingdescription = listing["description"] as? String,
            let status = listing["status"] as? Int,
            let createAt = listing["createAt"] as? String else {
                return nil
        }
        
        
        
        
        return Listing(_id: id, idCategory: idCategory, idUser: idUser, pseudo: pseudo, idVolunteer: idVolunteer, photoPath: photoPath, title: title, Listingdescription: Listingdescription, status: status, createAt: createAt)
    }
    
   
    static func dictionaryFrom(listing: Listing) -> [String: Any] {
        return [
            "idCategory": listing.idCategory ?? nil,
            "userID": listing.idUser,
            "pseudo": listing.pseudo ?? "psuedo",
            "idVolunteer": listing.idVolunteer ?? nil,
            "title": listing.title ?? "default_Title",
            "description": listing.Listingdescription ?? "defaultdescription",
            "status": listing.status ?? 0,
            "photoPath": listing.photoPath ,
            "createAt": listing.createAt ?? nil
            
        ]
    }

}

