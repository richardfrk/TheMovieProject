
import UIKit
import Foundation
import PlaygroundSupport

class MovieTableViewController : UITableViewController {
    
    var dataSource = [
        "title":"The Lego Batman Movie",
        "posterPath":"/1pHOqpdCYNmtRVJs6pGKQKttrPm.jpg",
        "genres":["Fantasy", "Action"],
        "releaseDate":"2017-02-08",
        "runtime":"104",
        "cast":["director":"Fulano de Tal","Main Actor":"Beltrano"],
        ] as [String : Any]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
        
        print(UIScreen.main.bounds.width)
        
        //self.tableView.contentInset = UIEdgeInsetsMake(-57, 0, 0, 0)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        switch section {
//        case 0:
//            return 2
//        case 1:
//            return 3
//        case 2:
//            return 2
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        switch section {
//        case 0:
//            return "Movie"
//        case 1:
//            return "Detail"
//        case 2:
//            return "Cast"
//        }
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 640.0
        } else {
            return 44.0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
//        switch indexPath.section {
//        case 0:
//            cell.textLabel?.text = dataSource[0]
//
//        case 1:
//            cell.textLabel?.text = dataSource[indexPath.section]["detail"]?["title"]
//        
//        case 2:
//            cell.textLabel?.text = dataSource[indexPath.section]["movie"]?["title"]
//
//        default:
//            break
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Richard")
    }
}

PlaygroundPage.current.liveView = MovieTableViewController()

var dataSource = [
    "title":"The Lego Batman Movie",
    "posterPath":"/1pHOqpdCYNmtRVJs6pGKQKttrPm.jpg",
    "genres":["Fantasy", "Action"],
    "releaseDate":"2017-02-08",
    "runtime":"104",
    "cast":["director":"Fulano de Tal","Main Actor":"Beltrano"],
    ] as [String:Any]

func parseDic(dic:[String:Any]) {
    
    print((dic["genres"] as! [String])[0])
    print((dic["cas"] as! [String:Any])["director"]!)
    
}

parseDic(dic: dataSource)
