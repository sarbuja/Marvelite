//
//  ComicsListCollectionViewCell.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

class ComicsListCollectionViewCell: UICollectionViewCell, ComicsListCell {

    var title: String? {
        didSet {
            nameLabel.text = title
        }
    }
    var imageUrl: URL? {
        didSet {
            thumbImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "no_image_placeholder"))
        }
    }
    var price: Double? {
        didSet {
            priceLabel.text = "\(price ?? 0)"
        }
    }
    
    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
}

extension ComicsListCollectionViewCell {
    
    struct Style {
        let labelStyle: UILabel.Style
        let labelBackground: UIColor
    }
    
    func setStyle(_ style: Style?) {
        guard let style = style else { return }
        
        nameLabel.style(using: style.labelStyle)
        nameLabel.backgroundColor = style.labelBackground
        priceLabel.style(using: style.labelStyle)
        priceLabel.backgroundColor = style.labelBackground
    }
}
