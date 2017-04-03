//
//  NetworkHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

enum NetworkMethod: String {
    case GET = "GET"
}

enum NetworkResponse {
    case success(Data)
    case failure(Error)
}

class NetworkHelper {
    
    class func request(endpoint: Endpoint, networkMethod: NetworkMethod, parameters: [String:String], completionHandler:@escaping (NetworkResponse) -> ()) {
        
        let nwURLComponents = URLComponents(url: endpoint.methodPath, parameters: parameters)
        
        guard let nwURL = nwURLComponents.url else {
            print("Problems with nwURLComponents \(nwURLComponents)")
            return
        }
        
        var nwRequest = URLRequest(url: nwURL)
        nwRequest.httpMethod = networkMethod.rawValue
        
        URLSession.shared.dataTask(with: nwRequest) { (nwData, nwResponse, nwError) in
            
            guard nwError == nil else {
                completionHandler(.failure(nwError!))
                return
            }
            
            guard let response = (nwResponse as? HTTPURLResponse),
                response.statusCode == 200 else {
                print("Problems with nwResponse \(nwResponse)")
                return
            }
            
            guard let data = nwData else {
                print("Problems with nwData \(nwData)")
                return
            }
            
            completionHandler(.success(data))
            
        }.resume()
    }
}
