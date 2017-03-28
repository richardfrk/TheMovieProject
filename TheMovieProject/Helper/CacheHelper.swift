//
//  CacheHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 07/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

class CacheHelper {
    
    class func downloadImageWithCache(url: String, completionHandler: @escaping (Data)->()) {
        
        guard let url = URL(string: url) else {
            print("URL Problems...")
            return
        }
        
        let memoCapacity = 10 * 1024 * 1024
        let diskCapacity = 10 * 1024 * 1024
        
        let cache = URLCache(memoryCapacity: memoCapacity, diskCapacity: diskCapacity, diskPath: "CachedImage")
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = cache
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60.0)
        
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                print("")
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
}
