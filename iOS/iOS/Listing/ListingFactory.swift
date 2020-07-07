//
//  ListingFactory.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class ListingFactory {
       
       var idCategory: String?
       var idUser: String?
       var psuedoUser: String?
       var idVolunteer: String?
       var photoPath: String?
       var title: String?
       var Requestdescription: String?
       var status: Int?
       var createAt: String?
    
    
    static func ListingFrom(listing: [String:Any]) -> Listing? {
        guard let id = listing["_id"] as? String,
            let idCategory = listing["idCategory"] as? String,
            let idUser = listing["idUser"] as? String,
            let psuedoUser = listing["psuedoUser"] as? String,
            let idVolunteer = listing["idVolunteer"] as? String,
            let photoPath = listing["photoPath"] as? String,
            let title = listing["title"] as? String,
            let Requestdescription = listing["description"] as? String,
            let status = listing["status"] as? Int,
            let createAt = listing["createAt"] as? String else {
                return nil
        }
        
        
        
        
        return Listing(_id: id, idCategory: idCategory, idUser: idUser, psuedoUser: psuedoUser, idVolunteer: idVolunteer, photoPath: photoPath, title: title, Requestdescription: Requestdescription, status: status, createAt: createAt)
    }
    
   
    static func dictionaryFrom(request: Listing) -> [String: Any] {
        return [
            "idCategory": request.idCategory ?? nil,
            "idUser": request.idUser,
            "psuedoUser": request.psuedoUser ?? "psuedo",
            "idVolunteer": request.idVolunteer ?? nil,
            "title": request.title ?? "default_Title",
            "description": request.Requestdescription ?? "defaultdescription",
            "status": request.status ?? 0,
            "photoPath": request.photoPath ,
            "createAt": request.createAt ?? "createAt"
            
            

        ]
    }

}

