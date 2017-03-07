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
        
        var imageView = UIImageView()
        imageView.urlDownloadWithCache(string: "https://image.tmdb.org/t/p/w185/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg")
                
        TMDbAPI.getGenreMovieList()
        
        //dataSource.append(TopListsModel(title: "One Title", likes: "234", coverURL: nil))
        //dataSource.append(TopListsModel(title: "Two Title", likes: "124", coverURL: nil))
        //dataSource.append(TopListsModel(title: "Three Title", likes: "57", coverURL: nil))
        //dataSource.append(TopListsModel(title: "One Title", likes: "234", coverURL: nil))
        //dataSource.append(TopListsModel(title: "Two Title", likes: "124", coverURL: nil))
        //dataSource.append(TopListsModel(title: "Three Title", likes: "57", coverURL: nil))
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TopListCollectionViewCell
        
        cell.titleListLabel.text = dataSource[indexPath.item].name ?? nil
        cell.numberLikeListLabel.text = dataSource[indexPath.item].likes ?? nil
        
        print(dataSource[indexPath.item].coverURL!)
    
        let url = URL(string: "https://image.tmdb.org/t/p/original/coJVIUEOToAEGViuhclM7pXC75R.jpg")!
        //cell.coverListView.kf.setImage(with: url)
                
        return cell
    }

}
