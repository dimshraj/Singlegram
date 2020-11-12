//
//  Gallery.swift
//  instCopy
//
//  Created by Dmitriy Shrayber on 05.11.2020.
//

import UIKit

struct Gallery {
    
    var posts:[Post]
    
    
    
    //    func createGallery() {
    //        for i in 0...7 {
    //            let post = Post(image: UIImage(named: "IMG_\(i)")!, label: "IMG_\(i)")
    //            posts.append(post)
    //
    //        }
    static func importPosts() -> [Post] {
        
        var posts = [Post]()
        
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
            return posts
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]  else {
                return posts
            }
            
            guard let postObjects = rootObject["posts"] as? [[String: String]] else {
                return posts
            }
            
            for postObject in postObjects {
                if let title = postObject["title"],
                   let info = postObject["info"],
                   let imageName = postObject["image"],
                   let image = UIImage(named: imageName) {
                    let post = Post(title: title, info: info, image: image, showInfo: false)
                    posts.append(post)
                }
            }
        } catch {
            return posts
            
        }
        return posts
        
    }
}
