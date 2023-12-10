//
//  CharacterDetailRouterImplementation.swift
//  PresentationLayer
//
//  Created by Santa Gurung on 15/02/2021.
//

import UIKit
import SafariServices

public class CharacterDetailRouterImpl: DisplayWeblinkRouter {

    private weak var appDIContainer: DIContainer?
    public weak var viewController: UIViewController?

    public init(appDIContainer: DIContainer) {
        self.appDIContainer = appDIContainer
    }

    public func presentWeblink(url: URL) {
        let safariVC = SFSafariViewController(url: url, configuration: SFSafariViewController.Configuration())
        safariVC.modalPresentationStyle = .pageSheet
        viewController?.present(safariVC, animated: true, completion: nil)
    }
}
