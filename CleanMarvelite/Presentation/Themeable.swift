//
//  Themeable.swift
//  PresentationLayer
//
//  Created by Santa Gurung on 22/02/2021.
//

import UIKit

public protocol Themeable {
    var primaryBackgroundColor: UIColor { get }
    var secondaryBackgroundColor: UIColor { get }
    var errorColor: UIColor { get }
    
    var primaryButtonColor: UIColor { get }
    var secondaryButtonColor: UIColor { get }
    var neutralButtonColor: UIColor { get }
    
    var primaryTextColor: UIColor { get }
    var secondaryTextColor: UIColor { get }
    var tertiaryTextColor: UIColor { get }
    
    var subtitleFont: UIFont { get }
    var titleFont: UIFont { get }
    var headingFont: UIFont { get }
    
    var labelBackgroundColor: UIColor { get }
    var labelSecondaryBgColor: UIColor { get }
}
