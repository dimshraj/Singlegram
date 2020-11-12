//
//  postModel.swift
//  instCopy
//
//  Created by Dmitriy Shrayber on 10.11.2020.
//

import UIKit

class Post {
    let title, info: String
    var image : UIImage
    var showInfo: Bool
    
    init(title: String, info: String, image: UIImage, showInfo: Bool) {
        self.title = title
        self.info = info
        self.image = image
        self.showInfo = showInfo
        
    }
}




