//
//  NetworkHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case GET = "GET"
}

class NetworkHelper {
    
    class func request(url: String, method: HttpMethod, parameters: [String:String]) {
        
        var myURLComponents = URLComponents()
        var queryItems = [URLQueryItem]()

        guard let myURL = URL(string: url),
            let urlScheme = myURL.scheme,
            let urlHost = myURL.host else {
            print("")
            return
        }
        
        for (key, value) in parameters {
            
            let queryItem = URLQueryItem(name: key, value: value)
            queryItems.append(queryItem)
        }
        
        myURLComponents.scheme = urlScheme
        myURLComponents.host = urlHost
        myURLComponents.path = myURL.path
        myURLComponents.queryItems = queryItems
        
        guard let newURL = myURLComponents.url else {
            print("")
            return
        }
        
        print(newURL)
        
        var myRequest = URLRequest(url: newURL)
        myRequest.httpMethod = method.rawValue
        
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
            
        }.resume()
    }
}
