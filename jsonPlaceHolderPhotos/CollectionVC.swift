//
//  CollectionVC.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

class CollectionVC: UICollectionViewController {
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    var myData = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadList()//對API發出Request
        // Register cell classes
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)//CollectionView內建
        
          }
    
    func loadList(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if(error != nil){
                print("發送失敗 ", error!.localizedDescription)
            }
            else{
                print("發送成功")
                    do{
                        self.myData = try JSONDecoder().decode([Photo].self,from: data!)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                            self.collectionView.collectionViewLayout = UICollectionViewFlowLayout() //更新collectionView
                            
                        }
                    }
                    catch{
                        print(error.localizedDescription)
                    }
            }
        }
        task.resume()
        
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(identifier: "CellDetailVC") as! CellDetailVC
        
        VC.photo = myData[indexPath.row]
        
        self.navigationController?.pushViewController(VC, animated: true)//puch to DetailViewController
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return myData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        cell.setCell(image: myData[indexPath.row].thumbnailUrl, id: myData[indexPath.row].id, title: myData[indexPath.row].title)
        
        return cell
    }
}

extension CollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int((collectionView.bounds.size.width/4))
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { //設定單元格左右之間距
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //設定單元格上下之間距
        return 0
    }
}


