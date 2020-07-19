//
//  SignupService.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class SignupService {
    
      func signup(user: User, completion: @escaping (Bool) -> Void) -> Void {
         //  guard let signupURL = URL(string: "https://findandtrade.herokuapp.com/signin") else {
             guard let signupURL = URL(string: "https://webhook.site/a382090f-c7b9-4522-988c-19a595fc9549") else {
                 return
             }
             var request = URLRequest(url: signupURL)
             request.httpMethod = "POST"
             request.httpBody = try? JSONSerialization.data(withJSONObject: SignupFactory.dictionaryFrom(user: user), options: .fragmentsAllowed)
             request.setValue("application/json", forHTTPHeaderField: "content-type")
             let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, res, err) in
                 if let httpRes = res as? HTTPURLResponse {
                  
                  completion(httpRes.statusCode == 200)
                 }
              
              if let data = data, let dataString = String(data: data, encoding: .utf8) {
                         print("data: \(dataString)")
                      completion(true)
              } else {

                  completion(false)
              }
              
             })
          
             task.resume()
         }


}
