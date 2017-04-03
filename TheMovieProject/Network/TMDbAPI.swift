//
//  TMDbAPI.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import UIKit

enum Endpoint {
    
    case searchMovie
    case uniqueMovie
    case genreMovieList
    case genreMovieById(Int)
    
    public var methodPath: String {
        
        switch self {
        
        case .searchMovie:
            return "https://api.themoviedb.org/3/search/movie"
        case .uniqueMovie:
            return "https://api.themoviedb.org/3/movie"
        case .genreMovieList:
            return "https://api.themoviedb.org/3/genre/movie/list"
        case .genreMovieById(let value):
            return "https://api.themoviedb.org/3/genre/\(value)/movies"

        }
    }
}

class TMDbAPI {
    
    typealias TMDBDictionary = [[String:Any]]
    
    class func getGenreMovieList(completionHandler:@escaping (TMDBDictionary)->()) {
        
        let myParameters = [
        "api_key":"280e4dd3ac750ddf0bb4ec7d576c215a",
        "language":"en-US",
        ]
        
        NetworkHelper.request(endpoint: .genreMovieList, networkMethod: .GET, parameters: myParameters) { (result) in
            
            switch result {
            case .success(let nhData):
                
                let json = JSONHelper.init(data: nhData, endpoint: .genreMovieList)
                completionHandler(json.value)
            
            case .failure(let error):
                print(error)
            }
        }
    }
    
    class func getSearchMovie(title: String, completionHandler:@escaping (TMDBDictionary)->()) {
        
        let myParameters = [
            "api_key":"280e4dd3ac750ddf0bb4ec7d576c215a",
            "language":"en-US",
            "query":title,
            "page":"1",
            "include_adult":"false"
            ]
        
        NetworkHelper.request(endpoint: .searchMovie, networkMethod: .GET, parameters: myParameters) { (response) in
            
            switch response {
            case .success(let nhData):
                
                let json = JSONHelper.init(data: nhData, endpoint: .searchMovie)
                completionHandler(json.value)
            
            case .failure(let error):
                print(error)
            }
        }
    }
    
    class func getGenreMoviesBy(id: Int, completionHandler:@escaping (TMDBDictionary)->()) {
        
        let myParameters = [
            "api_key":"280e4dd3ac750ddf0bb4ec7d576c215a",
            "language":"en-US",
            "sort_by":"created_at.asc",
            "include_adult":"false"
        ]
        
        NetworkHelper.request(endpoint: .genreMovieById(id) , networkMethod: .GET, parameters: myParameters) { (response) in
            
            switch response {
            case .success(let nhData):
            
                let json = JSONHelper.init(data: nhData, endpoint: .genreMovieById(id))
                completionHandler(json.value)
            
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
