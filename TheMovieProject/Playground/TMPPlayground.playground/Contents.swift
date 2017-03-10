//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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
            
            print("Data \(data)")
            
            guard let data = data else {
                print("Algo")
                return
            }
            
            completionHandler(data)
            
            }.resume()
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CacheHelper.downloadImageWithCache(url: "https://image.tmdb.org/t/p/w185/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg") { (data) in
            
            self.view.addSubview(UIImageView(image: UIImage(data: data)))
        }
        
    }
}

PlaygroundPage.current.liveView = ViewController()




