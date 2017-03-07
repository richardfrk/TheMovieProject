//
//  UIImage+Extension.swift
//  TheMovieProject
//
//  Created by Richard Frank on 07/03/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func urlDownloadWithCache(string: String) {
        
        CacheHelper.downloadImageWithCache(url: string) { (data) in
            
            self.image = UIImage(data: data)
        }
    }
}
