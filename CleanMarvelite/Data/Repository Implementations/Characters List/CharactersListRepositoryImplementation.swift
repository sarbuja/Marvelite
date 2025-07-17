//
//  CharactersListRepositoryImplementation.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public class CharactersListRepositoryImpl: CharactersListRepository {

    private let charactersRemoteDataSource: CharactersListRemoteDataSource

    public init(charactersRemoteDataSource: CharactersListRemoteDataSource) {
        self.charactersRemoteDataSource = charactersRemoteDataSource
    }

    public func getCharacters() async throws -> [CharacterEntity] {
        let characters = try await charactersRemoteDataSource.getCharacters()
        return characters
    }
}
