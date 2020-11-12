//
//  UserFeedTableViewController.swift
//  instCopy
//
//  Created by Dmitriy Shrayber on 08.11.2020.
//

import UIKit

class UserFeedTableViewController: UIViewController {
    @IBOutlet var tableViewFeed: UITableView!
    var userGalleryfeed = Gallery.importPosts()
    var index:IndexPath = [0, 0] {
        didSet {
            print(index)
        }
    }
    let defaultInfo = "Show info >"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFeed.delegate = self
        tableViewFeed.dataSource = self

        
    }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableViewFeed.scrollToRow(at: index, at: .middle, animated: false)
            print(index)
        }
    // MARK: - Table view data source
    
}
extension UserFeedTableViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! UserFeedTableViewCell
        cell.postImage.image =  userGalleryfeed[indexPath.item].image
        cell.postLabel.text = userGalleryfeed[indexPath.item].title
        cell.info.text = defaultInfo
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  userGalleryfeed.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserFeedTableViewCell else {
            return
        }
        
        let post = userGalleryfeed[indexPath.row]
        
        post.showInfo = !post.showInfo
        userGalleryfeed[indexPath.row] = post
        
        cell.info.text = post.showInfo ? post.info : defaultInfo
        cell.info.textAlignment = post.showInfo ? .left : .center
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        print(indexPath)
    }
    
    
}




