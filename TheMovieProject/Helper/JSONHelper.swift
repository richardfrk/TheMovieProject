//
//  JSONHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 01/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation

class JSONHelper {
    
    init(data: Data) {
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            print(json["genres"])
        } catch {
            print("")
        }
    }
}
