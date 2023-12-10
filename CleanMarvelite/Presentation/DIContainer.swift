//
//  DIContainer.swift
//  PresentationLayer
//
//  Created by Santa Gurung on 15/02/2021.
//

import UIKit

public protocol DIContainer: AnyObject {
    func homeDependencies() -> HomeViewController
    func favoritesDependencies() -> FavoritesViewController
    func characterDetailDependencies(id: Int) -> CharacterDetailViewController
}
