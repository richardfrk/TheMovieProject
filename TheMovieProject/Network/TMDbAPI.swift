//
//  TMDbAPI.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

enum MethodURL: String {
    
    case searchMovie = "https://api.themoviedb.org/3/search/movie"
    case movieDetail = "https://api.themoviedb.org/3/movie/"
    case URLTest = "https://api.themoviedb.org/3/search/movie?api_key=280e4dd3ac750ddf0bb4ec7d576c215a&language=en-US&query=Batman&page=1&include_adult=false"
}

class TMDbAPI {
    
    class func getGenreMovieList() {
        
        NetworkHelper.request(url: <#T##String#>, method: <#T##HttpMethod#>)
        
    }
    
    
}
