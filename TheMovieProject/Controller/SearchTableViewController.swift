//
//  SearchTableViewController.swift
//  TheMovieProject
//
//  Created by Richard Frank on 09/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var searchResults = [[String:Any]]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addSearchBar()
    }
    
    private func addSearchBar() {
        
        let sSearchBar = UISearchBar()
        sSearchBar.placeholder = "Search"
        sSearchBar.delegate = self
        self.navigationItem.titleView = sSearchBar
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        
        if let originalTitle = searchResults[indexPath.row]["original_title"] as? String {
            cell.searchTitleLabel.text = originalTitle
        }
        
        if let releaseDate = searchResults[indexPath.row]["release_date"] as? String {
            cell.searchYearLabel.text = releaseDate
        }
        
        DispatchQueue.global().async {
            
            if let posterPath = self.searchResults[indexPath.row]["poster_path"] as? String {
                
                CacheHelper.downloadImageWithCache(url: "https://image.tmdb.org/t/p/w185\(posterPath)", completionHandler: { (data) in
                    
                    DispatchQueue.main.async {
                        cell.searchPosterImage.image = UIImage(data: data)
                    }
                    
                })
            }
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

extension SearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text, text.count > 1 else {
            print("")
            return
        }
        
        TMDbAPI.getSearchMovie(title: text) { (dictionary) in
            
            self.searchResults = dictionary
        }
    }

    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
}
