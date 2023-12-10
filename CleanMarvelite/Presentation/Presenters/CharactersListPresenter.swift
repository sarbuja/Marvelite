//
//  CharactersListPresenter.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

public protocol CharacterListCell: AnyObject {
    var name: String? { get set }
    var imageUrl: URL? { get set }
}

public protocol CharactersListPresenter {
    var title: String { get }
    var summary: String { get }
    var numberOfItems: Int { get }
    func fetchCharacters() async throws
    func pushToCharacterDetail(at index: Int)
    func configureCell(_ cell: CharacterListCell, at index: Int)
}

public class CharactersListPresenterImpl {

    private var characters: [CharacterEntity]?
    private let router: GoToCharacterDetailRouter
    private var usecase: CharactersListUseCase

    public init(router: GoToCharacterDetailRouter,
                usecase: CharactersListUseCase) {
        self.router = router
        self.usecase = usecase
    }
}

extension CharactersListPresenterImpl: CharactersListPresenter {

    public func fetchCharacters() async throws {
        characters = try await usecase.fetchCharacters()
    }
    
    public var title: String {
        return "Characters"
    }

    public var summary: String {
        return "These are the marvel characters displayed in the horizontal scroll format."
    }

    public var numberOfItems: Int {
        return characters?.count ?? 0
    }

    public func configureCell(_ cell: CharacterListCell, at index: Int) {
        guard let character = characters?[safe: index] else { return }
        cell.name = character.name
        cell.imageUrl = character.thumbnailUrl
    }

    public func pushToCharacterDetail(at index: Int) {
        guard let character = characters?[safe: index] else { return }
        router.showCharacterDetail(with: character.id)
    }
}
