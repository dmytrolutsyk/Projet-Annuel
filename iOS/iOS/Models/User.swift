
//  Trade.swift
//  iOS
//
//  Created by Norman on 29/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class User: CustomStringConvertible {
 
    
    var username: String?
    var password: String?
    var type: String?
    var pseudo: String?
    var firstname: String?
    var lastname: String?
    var birthdate: String?
    var sex: Bool?
    var photo: String?
    var requestIssued: Int?
    var requestFulfilled: Int?
    var _id: String?
    
    
    
    
    init(username: String?, password: String?) {
        self.username = username
        self.password = password
    }
    
    convenience init (_id: String?,username: String?, password: String?, type: String?, pseudo: String?, firstname: String?, lastname: String?, birthdate: String?, sex: Bool?, photo: String?, requestIssued: Int?, requestFulfilled: Int? ) {
        self.init(username: username, password: password)
        self._id = _id
        self.username = username
        self.password = password
        self.type = type
        self.pseudo = pseudo
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.sex = sex
        self.photo = photo
        self.requestIssued = requestIssued
        self.requestFulfilled = requestFulfilled
    }
    
    var description: String {
        return "{ Mail: \(self.username ), Password: \(self.password), type: \(self.type), pseudo: \(self.pseudo), firstname: \(self.firstname), sex: \(self.sex), photo: \(self.photo), requestIssued: \(self.requestIssued), requestfulfilled: \(self.requestFulfilled), id: \(_id) }"
    }
}
