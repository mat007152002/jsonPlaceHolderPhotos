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
    
    var cells:[Cell] = [
        Cell(id: "1", title: "1", image: "1"),
        Cell(id: "2", title: "2", image: "2"),
        Cell(id: "3", title: "3", image: "3"),
        Cell(id: "4", title: "4", image: "4"),
        Cell(id: "5", title: "5", image: "5"),
        Cell(id: "6", title: "6", image: "6"),
        Cell(id: "7", title: "7", image: "7"),
        Cell(id: "8", title: "8", image: "8"),
        Cell(id: "9", title: "9", image: "9"),
        Cell(id: "10", title: "10", image: "10")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)

        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
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
        return cells.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        /*
        cell.ImageView.image = UIImage(named: cells[indexPath.row].image)
        cell.idLabel.text = cells[indexPath.row].id
        cell.titleLabel.text = cells[indexPath.row].title
        */
    
        cell.setCell(image: cells[indexPath.row].image, id: cells[indexPath.row].id, title: cells[indexPath.row].title)
        
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
