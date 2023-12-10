//
//  CharactersListRouterImplementation.swift
//  PresentationLayer
//
//  Created by Santa Gurung on 15/02/2021.
//

import UIKit

public class CharactersListRouterImpl: GoToCharacterDetailRouter {

    private weak var appDIContainer: DIContainer?
    public weak var viewController: UIViewController?

    public init(appDIContainer: DIContainer) {
        self.appDIContainer = appDIContainer
    }

    public func showCharacterDetail(with id: Int) {
        guard let detailController = appDIContainer?.characterDetailDependencies(id: id) else { return }
        viewController?.navigationController?.pushViewController(detailController, animated: true)
    }
}
