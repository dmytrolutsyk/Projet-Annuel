//
//  Listing.swift
//  iOS
//
//  Created by Norman on 02/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class Listing: CustomStringConvertible {
 
    
    var _id: String?
    var idCategory: String?
    var idUser: String?
    var pseudo: String?
    var idVolunteer: String?
    var photoPath: String?
    var title: String?
    var Listingdescription: String?
    var status: Int?
    var createAt: String?

    
    init(idCategory: String?, idUser: String?, pseudo: String?, idVolunteer: String?, photoPath: String?, title: String?, Listingdescription: String?, status: Int?, createAt: String?) {
        
        
        self.idCategory = idCategory
        self.idUser = idUser
        self.pseudo = pseudo
        self.idVolunteer = idVolunteer
        self.photoPath = photoPath
        self.title = title
        self.Listingdescription = Listingdescription
        self.status = status
        self.createAt = createAt
        
        
   
    }
    
    convenience init(_id: String?,idCategory: String?, idUser: String?, pseudo: String?, idVolunteer: String?, photoPath: String?, title: String?, Listingdescription: String?, status: Int?, createAt: String?) {
        self.init(idCategory: idCategory, idUser: idUser, pseudo: pseudo, idVolunteer: idVolunteer, photoPath: photoPath, title: title, Listingdescription: Listingdescription, status: status, createAt: createAt)
         self._id = _id
         self.idCategory = idCategory
         self.idUser = idUser
         self.pseudo = pseudo
         self.idVolunteer = idVolunteer
         self.photoPath = photoPath
         self.title = title
         self.Listingdescription = Listingdescription
         self.status = status
         self.createAt = createAt
         
    
     }
    
 
    
    var description: String {
    return "{ idCategory: \(self.idCategory ), idUser: \(self.idUser), pseudo: \(self.pseudo), idVolunteer: \(self.idVolunteer), photoPath: \(self.photoPath), title: \(self.title), Listingdescription: \(self.Listingdescription), status: \(self.status) createAt: \(self.createAt) }"
    }
}
