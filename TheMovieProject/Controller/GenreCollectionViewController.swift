//
//  GenreCollectionViewController.swift
//  TheMovieProject
//
//  Created by Richard Frank on 21/01/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import UIKit

class GenreCollectionViewController: UICollectionViewController {
    
    var dataSource: [[String:String]] = [] {
        didSet{
            collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        dataSource.append(["name":"Richard"])
        dataSource.append(["name":"Frank"])
        dataSource.append(["name":"Cocco"])
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCollectionViewCell
            
        return cell
    }
}
