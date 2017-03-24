//
//  DiscoverCollectionViewController.swift
//  TheMovieProject
//
//  Created by Richard Frank on 17/01/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import UIKit
import Firebase


class TopListCollectionViewController: UICollectionViewController {
    
    var dataSource = [TopListsModel]() {
        didSet {
            collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseHelper.shared.reference().child("lists").observe(.value, with: { (snapshot) in
            
            let value = snapshot.
            
        })
        
        TMDbAPI.getGenreMovieList()
    
        //FirebaseHelper.shared.reference().child("lists").childByAutoId().setValue(["title":"My First Title List","likes":123,"coverURL":""])
    }
    
    func configureCell(cell: TopListCollectionViewCell) -> TopListCollectionViewCell {
        
        
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let topListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopListCell", for: indexPath) as! TopListCollectionViewCell
                
        return topListCell
    }

}
