//
//  NetworkHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
}

class NetworkHelper {
    
    class func request(urlMethod: URLMethod, httpMethod: HTTPMethod, parameters: [String:String], completionHandler:@escaping ([[String:Any]]) -> ()) {
        
        let urlComponents = URLComponents(url: urlMethod.rawValue, parameters: parameters)
        
        guard let newURL = urlComponents.url else {
            print("")
            return
        }
        
        var myRequest = URLRequest(url: newURL)
        myRequest.httpMethod = httpMethod.rawValue
        
        URLSession.shared.dataTask(with: myRequest) { (data, response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let response = (response as? HTTPURLResponse),
                response.statusCode == 200 else {
                print("")
                return
            }
            
            guard let result = data else {
                print("")
                return
            }
            
            guard let dic = JSONHelper(result).dictionary else {
                print("")
                return
            }
            
            completionHandler(dic)
            
        }.resume()
    }
}
