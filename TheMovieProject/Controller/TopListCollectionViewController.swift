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
        
        NetworkHelper.request(url: "https://api.themoviedb.org/3/genre/movie/list?api_key=280e4dd3ac750ddf0bb4ec7d576c215a&language=en-US", method: .GET)
        
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
