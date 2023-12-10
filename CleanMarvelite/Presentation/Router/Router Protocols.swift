//
//  Router Protocols.swift
//  PresentationLayer
//
//  Created by Santa Gurung on 15/02/2021.
//

import Foundation

public protocol GoToCharacterDetailRouter {
    func showCharacterDetail(with id: Int)
}

public protocol DisplayWeblinkRouter {
    func presentWeblink(url: URL)
}
