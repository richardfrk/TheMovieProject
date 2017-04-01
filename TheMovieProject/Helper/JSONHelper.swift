//
//  JSONHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

enum APIMethod: String {
    case genreList = "genres"
    case searchMovie = "results"
}

struct JSONHelper {
    
    var value: [[String:Any]] = [[:]]

    init(data: Data, apiMethod: APIMethod) {
        
        do {
            
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            switch apiMethod {
            
            case .genreList:
                
                let dictionary = json["genres"] as! [[String:Any]]
                self.value = dictionary
                
            case .searchMovie:
                
                let dictionary = json["results"] as! [[String:Any]]
                self.value = dictionary
                
            default:
                break
            }
            
        } catch {
            print("")
        }
    }
}
