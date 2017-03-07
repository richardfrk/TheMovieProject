//
//  UIImage+Extension.swift
//  TheMovieProject
//
//  Created by Richard Frank on 07/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    convenience init(urlDownloadWithCache: String) {
        
        var data: Data?
        
        CacheHelper.downloadImageWithCache(url: urlDownloadWithCache) { (data) in
            
            data = data
        }
        
        self.init(data: data!)!
    }
    
}
