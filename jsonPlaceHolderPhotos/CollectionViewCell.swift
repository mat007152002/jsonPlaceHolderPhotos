//
//  CollectionViewCell.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(image: String, id: String, title: String){
        ImageView.image = UIImage(named: image)
        idLabel.text = id
        titleLabel.text = title
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
