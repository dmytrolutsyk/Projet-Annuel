//
//  UserFactory.swift
//  iOS
//
//  Created by Norman on 25/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class UserFactory {
     
        
    var username: String
    var password: String
    var pseudo: String
    var type: String
    var firstname: String
    var lastname: String
    var birthdate: String
    var sex: Bool
    var photo: String
    var requestIssued: Int
    var requestFulfilled: Int
    
    init(username: String, password: String, type: String, pseudo: String, firstname: String, lastname: String, birthdate: String, sex: Bool, photo: String, requestIssued: Int, requestFulfilled: Int) {
        
        self.username = username
        self.password = password
        self.pseudo = pseudo
        self.type = type
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.sex = sex
        self.photo = photo
        self.requestIssued = requestIssued
        self.requestFulfilled = requestFulfilled
    }
        
    
    static func userFrom(user: [String: Any]) -> User? {
        guard let id = user["_id"] as? String,
                 let username = user["username"] as? String,
                 let password = user["password"] as? String,
                 let pseudo = user["pseudo"] as? String,
                 let type = user["type"] as? String,
                 let firstname = user["firstname"] as? String,
                 let lastname = user["lastname"] as? String,
                 let birthdate = user["birthdate"] as? String,
                 let sex = user["sex"] as? Bool,
                 let photo = user["photo"] as? String,
                 let requestIssued = user["requestIssued"] as? Int,
                 let requestFulfilled = user["requestFulfilled"] as? Int
           else {
                   return nil
           }
        let user = User(_id: id,username: username, password: password, type: type, pseudo: pseudo, firstname: firstname, lastname:lastname,
                        birthdate: birthdate.debugDescription, sex: sex, photo: photo, requestIssued: requestIssued, requestFulfilled: requestFulfilled)
           return user
       }
    
    static func dictionaryFrom(user: User) -> [String: Any] {
        return [
            "username": user.username ?? "defaultName",
            "password": user.password ?? "defaultpassword",
            "pseudo": user.pseudo ?? "defaultpseudo",
            "type": user.type ?? "defaulttype",
            "firstname": user.firstname ?? "defaultfirstname",
            "lastname": user.lastname ?? "defaultlastname",
            "birthdate": user.birthdate ?? nil,
            "sex": user.sex ?? false,
            "photo": user.photo ?? "defaultphoto",
            "requestIssued": user.requestIssued ?? 0,
            "requestFulfilled": user.requestFulfilled ?? 0
        ]
    }
}
