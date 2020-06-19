//
//  LoginService.swift
//  iOS
//
//  Created by Norman on 26/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

class LoginService {
    
    func login(user: User, completion: @escaping (Bool) -> Void) -> Void {
           guard let loginURL = URL(string: "https://findandtrade.herokuapp.com/signin") else {
               return
           }
           var request = URLRequest(url: loginURL)
           request.httpMethod = "POST"
           request.httpBody = try? JSONSerialization.data(withJSONObject: LoginFactory.dictionaryFrom(user: user), options: .fragmentsAllowed)
           request.setValue("application/json", forHTTPHeaderField: "content-type")
         //  request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWIwM2IxZGIzNWJkMzcxYmM2NDQxN2IiLCJ1c2VybmFtZSI6ImJlcm5hcmQiLCJwYXNzd29yZCI6IiQyYiQwNSQ1NXk4WmNtVDJobVNpSFpuSFNxelguM2kyZTRlYjVWS3RNUHd4aWpwZlo2RjJjQXkzUTJHMiIsImlhdCI6MTU5MTgzMjA2MywiZXhwIjoxNTkxOTE4NDYzfQ.GqVwzlbNdwycq2zrsXmm13Z7O7411-UcmP84BXi1IxA", forHTTPHeaderField: "x-access-token")

           let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, res, err) in
               if let httpRes = res as? HTTPURLResponse {
                
                completion(httpRes.statusCode == 200)
               }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                       print("data: \(dataString)")
                       print("TRUE")
                    completion(true)
            } else {
                print("FALSE")
                completion(false)
            }
            
           })
        
           task.resume()
       }

}
 
