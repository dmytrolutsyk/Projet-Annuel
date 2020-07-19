//
//  Login.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class User: CustomStringConvertible {
 
    
    var email: String?
    var password: String?
    var type: String?
    var username: String?
    var phone: String?
    var city: String?
    
    
    
    
    
    init(username: String?, password: String?) {
        self.username = username
        self.password = password
    }
    
    convenience init (email: String?, password: String?, type: String?, username: String?, phone: String?, city: String? ) {
        self.init(username: username, password: password)
        self.email = email
        self.password = password
        self.type = type
        self.username = username
        self.phone = phone
        self.city = city
        
    }
    
    var description: String {
        return "{ Mail: \(self.email ), Password: \(self.password), type: \(self.type), username: \(self.username), phone: \(self.phone) }"
    }
}
