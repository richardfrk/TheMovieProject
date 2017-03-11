//
//  UIViewController+Extension.swift
//  TheMovieProject
//
//  Created by Richard Frank on 28/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func printAlert(_ string: String) {
        
        let printAlert = UIAlertController(title: "Print Alert", message: string, preferredStyle: .alert)
        let printAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        printAlert.addAction(printAlertAction)
            
        self.present(printAlert, animated: true, completion: nil)
    }
}

extension UITableViewController {
    
    override func printAlert(_ string: String) {
        
        let printAlert = UIAlertController(title: "Print Alert", message: string, preferredStyle: .alert)
        let printAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        printAlert.addAction(printAlertAction)
        
        self.present(printAlert, animated: true, completion: nil)
    }
}
