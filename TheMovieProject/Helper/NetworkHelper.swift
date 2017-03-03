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
        
        var myURL = URL(string: url)
        
        var myURLComponents = URLComponents()
        myURLComponents.scheme = myURL?.scheme
        myURLComponents.host = myURL?.host
        myURLComponents.path = myURL?.path
        
        myURLComponents.
        
        var myParameters = URLQueryItem.init(name: <#T##String#>, value: <#T##String?#>)

        
        guard let myURL = URL(string: url) else { return }
        
        var myRequest = URLRequest(url: myURL)
        myRequest.httpMethod = method.rawValue
        
        var session = URLSession()
        session.que
        
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
