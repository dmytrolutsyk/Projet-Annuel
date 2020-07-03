//
//  Signup.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation


class Signup: CustomStringConvertible {

var username: String?
var password: String?
var email: String?
var city: String?
var phone: String?
var usertype: String?

 init (username: String?,password: String?, email: String?, city: String?, phone: String?, usertype: String?) {
    self.username = username
    self.password = password
    self.email = password
    self.city = password
    self.phone = password
    self.usertype = password
}

    var description: String {
        return "{ Username: \(self.username ), Password: \(self.password), Email: \(self.email), city: \(self.city), phone: \(self.phone), usertype: \(self.usertype) }"
    }
    
}
