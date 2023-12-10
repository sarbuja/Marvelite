//
//  CharactersListUseCase.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public protocol CharactersListUseCase {
    func fetchCharacters() async throws -> [CharacterEntity]
}

public class CharactersListUseCaseImpl: CharactersListUseCase {

    private let charactersRepository: CharactersListRepository

    public init(charactersRepository: CharactersListRepository) {
        self.charactersRepository = charactersRepository
    }

    public func fetchCharacters() async throws -> [CharacterEntity] {
        return try await charactersRepository.getCharacters()
    }
}
