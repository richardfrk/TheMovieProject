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
        
        let mySearchBar = UISearchBar()
        mySearchBar.placeholder = "Search"
        mySearchBar.delegate = self
        self.navigationItem.titleView = mySearchBar
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MySearchCell", for: indexPath)
        
        if let originalTitle = searchResults[indexPath.row]["original_title"] as? String {
            cell.textLabel?.text = originalTitle
        }
        
        return cell
    }

}

extension SearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text, text.characters.count > 1 else {
            print("")
            return
        }
        
        TMDbAPI.getSearchMovie(title: text) { (dic) in
            
            self.searchResults = dic
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        printAlert("")
        searchResults.removeAll()
        tableView.reloadData()
    }
}
