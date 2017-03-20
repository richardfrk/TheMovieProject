//
//  URLComponents+Extension.swift
//  TheMovieProject
//
//  Created by Richard Frank on 03/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

extension URLComponents {
    
    init(url: String, parameters: [String:String]) {
        self.init()
        
        var queryItems = [URLQueryItem]()
        
        guard let validURL = URL(string: url) else {
            print("")
            return
        }
        
        guard let scheme = validURL.scheme, let host = validURL.host else {
            print("")
            return
        }
        
        self.scheme = scheme
        self.host = host
        self.path = validURL.path
        
        for (key, value) in parameters {
            
            let queryItem = URLQueryItem(name: key, value: value)
            queryItems.append(queryItem)
        }
        
        self.queryItems = queryItems
    }
}
