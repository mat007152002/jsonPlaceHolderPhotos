//
//  CellDetailVC.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

class CellDetailVC: UIViewController {
    @IBOutlet var DetailImageView: UIImageView!
    @IBOutlet var DetailIdLabel: UILabel!
    @IBOutlet var DetailTitleLabel: UILabel!
    
    //var cell = Cell2(from:)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DetailIdLabel.text = cell.id
//        DetailTitleLabel.text = cell.title
//        DetailImageView.image = UIImage(named: cell.thumbnailUrl)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
