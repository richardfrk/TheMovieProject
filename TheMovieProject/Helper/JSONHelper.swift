//
//  JSONHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

struct JSONHelper {
    
    var dictionary: [[String:Any]]?

    init(_ data: Data) {
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            let dic = json["genres"] as! [[String:Any]]
            self.dictionary = dic
            
        } catch {
            print("")
        }
    }
}
