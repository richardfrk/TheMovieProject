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

    init(data: Data, urlMethod: URLMethod) {
        
        do {
            
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            switch urlMethod {
            
            case .genreListMovie:
                
                let dic = json["genres"] as! [[String:Any]]
                self.value = dic
                
            case .searchMovie:
                
                let dic = json["results"] as! [[String:Any]]
                self.value = dic
                
            default:
                break
            }
            
        } catch {
            print("")
        }
    }
}
