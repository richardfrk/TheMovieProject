
import UIKit
import Foundation
import PlaygroundSupport

class MovieTableViewController : UITableViewController {
    
    var dataSource = [
    ["title":"The Lego Batman Movie"],
    ["posterPath":"/1pHOqpdCYNmtRVJs6pGKQKttrPm.jpg"],
    ["genres":"Fantasy, Action"],
    ["releaseDate":"2017-02-08"],
    ["runtime":"104"],
    ["runtime":"104"],

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
        
        print(UIScreen.main.bounds.width)
        
        //self.tableView.contentInset = UIEdgeInsetsMake(-57, 0, 0, 0)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Movie"
        } else {
            return "Cast"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 640.0
        } else {
            return 44.0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
        
            cell.textLabel?.text = dataSource[indexPath.section]["title"]

        case 1:
            
            cell.textLabel?.text = dataSource[indexPath.section]["director"]

        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Richard")
    }
}

PlaygroundPage.current.liveView = MovieTableViewController()
