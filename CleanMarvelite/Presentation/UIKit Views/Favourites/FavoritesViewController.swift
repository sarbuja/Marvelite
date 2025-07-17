//
//  FavoritesViewController.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

public class FavoritesViewController: UIViewController {

    private let themeManager: ThemeManager
    
    public init (theme: Themeable) {
        self.themeManager = ThemeManager(theme: theme)
        super.init(nibName: "FavoritesViewController", bundle: Bundle(for: FavoritesViewController.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
