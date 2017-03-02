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
    
    class func request(url: String, method: HttpMethod) {
        
        guard let myURL = URL(string: url) else { return }
        
        var myRequest = URLRequest(url: myURL)
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
            
            JSONHelper(data: result)
            
            
        }.resume()
    }
}
