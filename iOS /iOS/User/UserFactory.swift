//
//  UserFactory.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class UserFactory {
     
        
    var email: String
    var password: String
    var username: String
    var type: String
    var phone: String
    var city: String
 
    
    init(email: String, password: String, type: String, username: String, phone: String, city: String) {
        
        self.email = email
        self.password = password
        self.username = username
        self.type = type
        self.phone = phone
        self.city = city
     
    }
        
    
    static func userFrom(user: [String: Any]) -> User? {
        guard    let email = user["email"] as? String,
                 let password = user["password"] as? String,
                 let username = user["username"] as? String,
                 let type = user["type"] as? String,
                 let phone = user["phone"] as? String,
                 let city = user["city"] as? String
                 
           else {
                   return nil
           }
        let user = User(email: email, password: password, type: type, username: username, phone: phone, city:city)
           return user
       }
    
    static func dictionaryFrom(user: User) -> [String: Any] {
        return [
            "username": user.username ?? "defaultusername",
            "password": user.password ?? "defaultpassword",
            "email": user.email ?? "defaultName",
            "phone": user.phone ?? "defaultphone",
            "city": user.city ?? "defaultcity",
            "usertype": user.type ?? "defaulttype"
        ]
    }
}
