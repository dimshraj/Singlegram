//
//  ViewController.swift
//  instCopy
//
//  Created by Dmitriy Shrayber on 03.11.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView1: UICollectionView!
    var selectedIndex:IndexPath?
    @IBOutlet weak var avatarImageView: UIImageView!
    var userGallery = Gallery.importPosts()
    let spacing = 2
    var cellsInLine = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.gray.cgColor
        
        collectionView1.dataSource = self
        collectionView1.delegate = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feed" {
            if let viewController = segue.destination as? UserFeedTableViewController,let cell = sender as? CollectionViewCell, let index = collectionView1.indexPath(for: cell) {
                viewController.index = index
                
            }
        }
    }
    
    @IBAction func selectViewType(_ sender: UISegmentedControl) {
        collectionView1.reloadData()
        switch sender.selectedSegmentIndex {
        case 0:
            cellsInLine = 1
        case 1:
            cellsInLine = 2
        case 2:
            cellsInLine = 3
        case 3:
            cellsInLine = 4
        default:
            cellsInLine = 1
            
        }    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userGallery.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = userGallery[indexPath.item].image
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cvFrame = collectionView.frame
        let cellWidth = (cvFrame.width - CGFloat(cellsInLine + 1) * CGFloat(spacing)) / CGFloat(cellsInLine)
        let cellHight = cellWidth
        return CGSize(width: cellWidth, height: cellHight)
    }
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        selectedIndex = indexPath
    //    }
}
