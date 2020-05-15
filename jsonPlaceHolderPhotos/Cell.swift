//
//  Cell.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import Foundation

struct Photo : Decodable {
    let id : Int
    let title : String
    let url : URL
    let thumbnailUrl : URL
}

class Cell {
    var id : String
    var albumId: String
    var title : String
    var thumbnailUrl : String
    
    init(id : String, albumID: String, title : String, thumbnailUrl : String){
        self.id = id
        self.albumId = albumID
        self.title = title
        self.thumbnailUrl = thumbnailUrl
    }//初始化器
    
    convenience init(){
        self.init(id: "", albumID: "", title: "", thumbnailUrl: "")
    }
}
