//
//  DiscoverViewController.swift
//  TheMovieProject
//
//  Created by Richard Frank on 21/01/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet weak var containerTopListView: UIView!
    @IBOutlet weak var containerGenreView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerTopListView.isHidden = false
        containerGenreView.isHidden = true

    }

    @IBAction func changedSegmentedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            containerTopListView.isHidden = false
            containerGenreView.isHidden = true
        case 1:
            containerTopListView.isHidden = true
            containerGenreView.isHidden = false
        default:
            printAlert("Default")
        }
    }
}
