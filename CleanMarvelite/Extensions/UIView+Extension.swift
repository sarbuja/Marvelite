//
//  UIView+Extension.swift
//  PresentationLayer
//
//  Created by Santa Gurung on 26/02/2021.
//

import UIKit

public protocol Stylable {
    associatedtype Style
    func style(using style: Style)
}

extension UILabel: Stylable {
    
    public struct Style {
        public let textColor: UIColor
        public let font: UIFont
        public let textAlignment: NSTextAlignment
        public let backgroundColor: UIColor
        
        public init(textColor: UIColor,
                    font: UIFont,
                    textAlignment: NSTextAlignment,
                    backgroundColor: UIColor) {
            self.textColor = textColor
            self.font = font
            self.textAlignment = textAlignment
            self.backgroundColor = backgroundColor
        }
    }

    public func style(using style: Style) {
        textColor = style.textColor
        font = style.font
        textAlignment = style.textAlignment
        backgroundColor = style.backgroundColor
    }
}

extension UIButton: Stylable {

    public struct Style {
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
        let titleStyle: UILabel.Style
        
        public init(backgroundColor: UIColor,
                    cornerRadius: CGFloat,
                    titleStyle: UILabel.Style) {
            self.cornerRadius = cornerRadius
            self.titleStyle = titleStyle
            self.backgroundColor = backgroundColor
        }
    }
    
    public func style(using style: Style) {
        backgroundColor = style.backgroundColor
        titleLabel?.style(using: style.titleStyle)
        layer.cornerRadius = style.cornerRadius
    }
}
