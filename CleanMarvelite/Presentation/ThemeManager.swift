//
//  ThemeManager.swift
//  PresentationLayer
//
//  Created by Santa Gurung on 26/02/2021.
//

import UIKit

class ThemeManager {
    
    private let theme: Themeable
    
    init(theme: Themeable) {
        self.theme = theme
    }
}
 
extension ThemeManager {
    
    var primaryBackgroundColor: UIColor {
        return theme.primaryBackgroundColor
    }
    
    var secondaryBackgroundColor: UIColor {
        return theme.secondaryBackgroundColor
    }
    
    var headingStyle: UILabel.Style {
        return UILabel.Style(
            textColor: theme.secondaryTextColor,
            font: theme.headingFont,
            textAlignment: .left,
            backgroundColor: .clear
        )
    }
    
    var paragraphStyle: UILabel.Style {
        return UILabel.Style(
            textColor: theme.primaryTextColor,
            font: theme.titleFont,
            textAlignment: .left,
            backgroundColor: .clear
        )
    }
    
    var captionStyle: UILabel.Style {
        return UILabel.Style(
            textColor: theme.primaryTextColor,
            font: theme.subtitleFont,
            textAlignment: .left,
            backgroundColor: .clear
        )
    }
    
    var charactersListStyle: CharactersListView.Style {
        return CharactersListView.Style(
            backgroundColor: theme.primaryBackgroundColor,
            titleStyle: UILabel.Style(
                textColor: theme.secondaryTextColor,
                font: theme.headingFont,
                textAlignment: .left,
                backgroundColor: .clear
            ),
            subtitleStyle: UILabel.Style(
                textColor: theme.primaryTextColor,
                font: theme.subtitleFont,
                textAlignment: .left,
                backgroundColor: .clear
            ),
            cellStyle: CharactersListCollectionViewCell.Style(
                labelStyle: UILabel.Style(
                    textColor: theme.tertiaryTextColor,
                    font: theme.subtitleFont,
                    textAlignment: .left,
                    backgroundColor: .clear
                ),
                labelBackground: theme.labelBackgroundColor
            )
        )
    }
    
    var comicsListStyle: ComicsListView.Style {
        return ComicsListView.Style(
            backgroundColor: theme.primaryBackgroundColor,
            titleStyle: UILabel.Style(
                textColor: theme.secondaryTextColor,
                font: theme.headingFont,
                textAlignment: .left,
                backgroundColor: .clear
            ),
            subtitleStyle: UILabel.Style(
                textColor: theme.primaryTextColor,
                font: theme.subtitleFont,
                textAlignment: .left,
                backgroundColor: .clear
            ),
            cellStyle: ComicsListCollectionViewCell.Style(
                labelStyle: UILabel.Style(
                    textColor: theme.tertiaryTextColor,
                    font: theme.subtitleFont,
                    textAlignment: .left,
                    backgroundColor: .clear
                ),
                labelBackground: theme.labelBackgroundColor
            )
        )
    }
}
