//
//  UserWebService.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import Foundation

typealias UserCompletion = ([User]) -> Void
class UserWebService {
    
    
    
    func newUser(user: User, completion: @escaping (Bool) -> Void) -> Void {
        guard let usertURL = URL(string: "https://webhook.site/a382090f-c7b9-4522-988c-19a595fc9549") else {
            return
        }
        var request = URLRequest(url: usertURL)
        request.httpMethod = "PATCH"
        request.httpBody = try? JSONSerialization.data(withJSONObject: UserFactory.dictionaryFrom(user: user), options: .fragmentsAllowed)
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, res, err) in
            if let httpRes = res as? HTTPURLResponse {
                print(httpRes.statusCode)
                completion(httpRes.statusCode == 201)
                return
            }
            print("Error \(err.debugDescription)")
            completion(false)
        })
        task.resume()
    }
    
  
    /*
    func getUsers(completion: @escaping UserCompletion) -> Void {
        guard let userUrl = URL(string: "") else {
            return;
        }
        let task = URLSession.shared.dataTask(with: userUrl) { (data,res,err) in
            guard let bytes = data,
            err == nil,
            let  json = try? JSONSerialization.jsonObject(with: bytes, options: .allowFragments) as? [Any] else {
                DispatchQueue.main.sync {
                    completion([])
                }
                    return
            }
            print(json)
            let users =  json.compactMap { (obj) -> User? in
                guard let uzer = obj as? [String: Any] else {
                    return nil
                }
                return UserFactory.userFrom(user: uzer)
            }
            DispatchQueue.main.sync {
                completion(users)
            }
            print(users)
        }
        task.resume()
        
        let date = Date()
        let arr = [User(_id: "_id", email: "email", password: "password", type:"type", pseudo : "pseudo", phone: "firstname", lastname: "lastname", birthdate: date.debugDescription, sex: true, photo: "photo", requestIssued: 1, requestFulfilled: 1 )]
        completion(arr)
    }
    */

    
    func deleteUser(id: String) -> Void {
        
       //let parameters = ["recipeId": id] as [String : String]
        guard let url = URL(string: "") else { return }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //guard let httpBody = try? JSONSerialization.data(withJSONObject:parameters, options: []) else { return }
        //request.httpBody = httpBody

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // ensure there is no error for this HTTP response
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            // ensure there is data returned from this HTTP response
            guard let content = data else {
                print("No data")
                return
            }
            
            // serialise the data / NSData object into Dictionary [String : Any]
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                return
            }
            print("got json response dictionary is \n \(json)")
            // update UI using the response here
        }

        // execute the HTTP request
        task.resume()
        
        
        
    }
    
    
    func modiUserTEST(id: String) -> Void {
        
       //let parameters = ["recipeId": id] as [String : String]
        guard let url = URL(string: "") else { return }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //guard let httpBody = try? JSONSerialization.data(withJSONObject:parameters, options: []) else { return }
        //request.httpBody = httpBody

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // ensure there is no error for this HTTP response
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            // ensure there is data returned from this HTTP response
            guard let content = data else {
                print("No data")
                return
            }
            
            // serialise the data / NSData object into Dictionary [String : Any]
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                return
            }
            print("got json response dictionary is \n \(json)")
            // update UI using the response here
        }

        // execute the HTTP request
        task.resume()
        
        
        
    }
    
}


