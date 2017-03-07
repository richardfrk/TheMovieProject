//
//  CacheHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 07/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

class CacheHelper {
    
    class func downloadImageWithCache(url: String, completionHandler:@escaping (Data) -> ()) {
        
        let url = URL(string: url)
        
        let memoCapacity = 10 * 1024 * 1024
        let diskCapacity = 10 * 1024 * 1024
        
        let cache = URLCache(memoryCapacity: memoCapacity, diskCapacity: diskCapacity, diskPath: "CachedImage")
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = cache
        
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: url!) { (data, response, error) in
            
            completionHandler(data!)
            
        }.resume()
        
        
    }
}
