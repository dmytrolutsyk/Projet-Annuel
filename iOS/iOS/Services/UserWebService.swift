//
//  UserWebService.swift
//  iOS
//
//  Created by Norman on 25/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

func saveUser(user: User , completion: @escaping (Bool) -> Void) -> Void {
       guard let userURL = URL(string: "https://moc-3a-movies.herokuapp.com/") else {
           return
       }
       var request = URLRequest(url: userURL)
       request.httpMethod = "POST"
       request.httpBody = try? JSONSerialization.data(withJSONObject: UserFactory.dictionaryFrom(user: user), options: .fragmentsAllowed)
       request.setValue("application/json", forHTTPHeaderField: "content-type")
       let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, res, err) in
           if let httpRes = res as? HTTPURLResponse {
               completion(httpRes.statusCode == 201)
               return
           }
           completion(false)
       })
       task.resume()
   }
