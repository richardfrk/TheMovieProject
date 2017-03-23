//
//  DiscoverCollectionViewController.swift
//  TheMovieProject
//
//  Created by Richard Frank on 17/01/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import UIKit


class TopListCollectionViewController: UICollectionViewController {
    
    var dataSource = [TopListsModel]() {
        didSet {
            collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        TMDbAPI.getGenreMovieList()
        
        FirebaseHelper.shared.reference().child("Testss").child("Teste2").child("Teste3").setValue("Brasil")
        
        FirebaseHelper.shared.reference().observe(.value, with: { (snapshot) in
            
            print(snapshot.value)
        })
        
        dataSource.append(TopListsModel(name: "One Title", likes: "234", coverURL: nil))
        dataSource.append(TopListsModel(name: "Two Title", likes: "124", coverURL: nil))
        dataSource.append(TopListsModel(name: "Three Title", likes: "57", coverURL: nil))
        dataSource.append(TopListsModel(name: "One Title", likes: "234", coverURL: nil))
        dataSource.append(TopListsModel(name: "Two Title", likes: "124", coverURL: nil))
        dataSource.append(TopListsModel(name: "Three Title", likes: "57", coverURL: nil))
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopListCell", for: indexPath) as! TopListCollectionViewCell
                
        return cell
    }

}
