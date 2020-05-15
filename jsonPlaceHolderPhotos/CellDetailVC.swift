//
//  CellDetailVC.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

class CellDetailVC: UIViewController { //用來呈現各Cell細節
    @IBOutlet var DetailImageView: UIImageView!
    @IBOutlet var DetailIdLabel: UILabel!
    @IBOutlet var DetailTitleLabel: UILabel!
    
    var photo:Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        DetailIdLabel.text = "id: "+"\((photo?.id)!)" /* or use "\(photo?.id ?? 0)"*/
        DetailTitleLabel.text = "title: "+(photo?.title)!
        DetailImageView.load(url: (photo?.url)!)

    }
}
