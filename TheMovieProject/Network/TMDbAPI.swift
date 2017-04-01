//
//  TMDbAPI.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import UIKit

enum URLMethod: String {
    
    case searchMovie = "https://api.themoviedb.org/3/search/movie"
    case movieDetail = "https://api.themoviedb.org/3/movie"
    case genreListMovie = "https://api.themoviedb.org/3/genre/movie/list"
}

class TMDbAPI {
    
    class func getGenreMovieList(completionHandler:@escaping ([[String:Any]])->()) {
        
        let myParameters = [
        "api_key":"280e4dd3ac750ddf0bb4ec7d576c215a",
        "language":"en-US",
        ]
        
        NetworkHelper.request(urlMethod: .genreListMovie, networkMethod: .GET, parameters: myParameters) { (result) in
            
            switch result {
            case .success(let data):
                let json = JSONHelper.init(data: data, apiMethod: .genreList)
                completionHandler(json.value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    class func getSearchMovie(title: String, completionHandler:@escaping ([[String:Any]])->()) {
        
        let myParameters = [
            "api_key":"280e4dd3ac750ddf0bb4ec7d576c215a",
            "language":"en-US",
            "query":title,
            "page":"1",
            "include_adult":"false"
            ]
        
        NetworkHelper.request(urlMethod: .searchMovie, networkMethod: .GET, parameters: myParameters) { (response) in
            
            switch response {
            case .success(let nhData):
                
                let json = JSONHelper.init(data: nhData, apiMethod: .searchMovie)
                completionHandler(json.value)
            
            case .failure(let error):
                
                print(error)
            }
            
        }
    }
}
