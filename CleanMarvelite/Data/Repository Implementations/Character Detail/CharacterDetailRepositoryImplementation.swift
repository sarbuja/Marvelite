//
//  CharacterDetailRepositoryImplementation.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public class CharacterDetailRepositoryImpl: CharacterDetailRepository {

    private let characterDetailRemoteDataSource: CharacterDetailRemoteDataSource

    public init(characterDetailRemoteDataSource: CharacterDetailRemoteDataSource) {
        self.characterDetailRemoteDataSource = characterDetailRemoteDataSource
    }

    public func getCharacterDetail() async throws -> CharacterEntity {
        let character = try await characterDetailRemoteDataSource.getCharacterDetail()
        return character
    }
}
