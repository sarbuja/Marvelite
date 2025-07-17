//
//  CharacterDetailPresenter.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

public protocol CharacterDetailPresenter {
    func fetchCharacter() async throws
    var imageUrl: URL? { get }
    var title: String? { get }
    var description: String? { get }
    var comicsFeatured: String? { get }
    func presentWebContent()
}

public class CharacterDetailPresenterImpl {

    private var character: CharacterEntity?
    private var router: DisplayWeblinkRouter
    private let usecase: CharacterDetailUseCase
    
    public init(router: DisplayWeblinkRouter,
         usecase: CharacterDetailUseCase) {
        self.router = router
        self.usecase = usecase
    }
}

extension CharacterDetailPresenterImpl: CharacterDetailPresenter {

    public func fetchCharacter() async throws {
        character = try await usecase.getCharacterDetail()
    }

    public var imageUrl: URL? {
        return character?.thumbnailUrl
    }

    public var title: String? {
        return character?.name
    }

    public var description: String? {
        return character?.description
    }

    public var comicsFeatured: String? {
        return character?.comics?.compactMap { $0.name }.joined(separator: " \n\n ")
    }

    public func presentWebContent() {
        guard let weblink = character?.webUrl else { return }
        router.presentWeblink(url: weblink)
    }
}
