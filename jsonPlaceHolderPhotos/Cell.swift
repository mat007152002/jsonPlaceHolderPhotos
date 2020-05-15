//
//  Cell.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import Foundation

struct Photo : Decodable { //用來儲存JSON資料的容器
    let id : Int
    let title : String
    let url : URL
    let thumbnailUrl : URL
}
