//
//  Cell.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import Foundation

class Cell {
    var id : String
    var title : String
    var image : String
    
    init(id : String, title : String, image : String){
        self.id = id
        self.title = title
        self.image = image
    }//初始化器
    
    convenience init(){
        self.init(id: "", title: "", image: "")
    }
}
