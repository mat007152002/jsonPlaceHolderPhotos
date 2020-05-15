//
//  photoRequest.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/15.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import Foundation

enum PhotoError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct PhotoRequest {
    
    let resourceURL : URL
    
    init(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
        self.resourceURL = url
    }
    
//    func getPhotos(completion: @escaping(Result<[photo], PhotoError>) -> Void) {
//
//        let dataTask = URLSession.shared.dataTask(with: resourceURL){ data ,_,_ in
//            guard let jsonData = data else {
//                completion(.failure(.noDataAvailable))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let photos = try decoder.decode(photo.self, from: jsonData)
//                completion(.success(p))
//            }
//        }
//        dataTask.resume()
//    }
}
