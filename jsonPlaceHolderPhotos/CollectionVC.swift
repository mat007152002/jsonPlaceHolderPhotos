//
//  CollectionVC.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class CollectionVC: UICollectionViewController {
    
    @IBOutlet var myCollectionView: UICollectionView!
    
//    var cells:[Cell] = [
//        Cell(id: "1", albumID: "1", title: "1", thumbnailUrl: "1"),
//    ]
    
    var cells : [Cell2]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadList()
        


        // Register cell classes
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)

        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
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
                //let str = String(data: data!, encoding: .utf8)!
//                print(str ?? "")
                
                do{
                    self.cells = try? JSONDecoder().decode([Cell2].self, from: data!)
                }
                catch{
                    print(error.localizedDescription)
                }

            }
            
        }
        
        task.resume()
        
    }

    // MARK: - Navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
    }
    */
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(identifier: "CellDetailVC") as! CellDetailVC
        
        VC.cell = cells[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cells!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
    
        cell.setCell(thumbimage: cells[indexPath.row].thumbnailUrl, id: <#T##String#>, title: <#T##String#>)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

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
