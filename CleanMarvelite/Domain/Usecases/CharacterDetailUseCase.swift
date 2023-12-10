//
//  CharacterDetailUseCase.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public protocol CharacterDetailUseCase {
    func getCharacterDetail() async throws -> CharacterEntity
}

public class CharacterDetailUseCaseImpl: CharacterDetailUseCase {

    private let characterDetailRepo: CharacterDetailRepository

    public init(characterDetailRepo: CharacterDetailRepository) {
        self.characterDetailRepo = characterDetailRepo
    }

    public func getCharacterDetail() async throws -> CharacterEntity {
        return try await characterDetailRepo.getCharacterDetail()
    }
}
