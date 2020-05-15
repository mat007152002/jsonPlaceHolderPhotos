//
//  Cell.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import Foundation


struct Cell2 : Codable{
    let id : Int
    let title : String
    let url : String
    let thumbnailUrl : String
    
    init(id : Int, title : String, url : String, thumbnailUrl : String) {
        self.id = id
        self.title = title
        self.thumbnailUrl = thumbnailUrl
        self.url = url
    }
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
