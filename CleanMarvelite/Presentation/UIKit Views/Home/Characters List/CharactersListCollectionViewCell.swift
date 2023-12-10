//
//  CharactersListCollectionViewCell.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

class CharactersListCollectionViewCell: UICollectionViewCell, CharacterListCell {

    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    var imageUrl: URL? {
        didSet {
            thumbImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "no_image_placeholder"))
        }
    }

    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
}

extension CharactersListCollectionViewCell {
    
    struct Style {
        let labelStyle: UILabel.Style
        let labelBackground: UIColor
    }
    
    func setStyle(_ style: Style?) {
        guard let style = style else { return }
        
        nameLabel.style(using: style.labelStyle)
        nameLabel.backgroundColor = style.labelBackground
    }
}
