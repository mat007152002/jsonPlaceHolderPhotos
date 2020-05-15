//
//  CollectionViewCell.swift
//  jsonPlaceHolderPhotos
//
//  Created by 旌榮 凌 on 2020/5/14.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell { //客製Cell for CollectionView
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(image: URL, id: Int, title: String){
        ImageView.load(url: image)
        idLabel.text = String(id)
        titleLabel.text = title
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension UIImageView {
    func load(url: URL) { //讓UIImageView載入url圖片
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
