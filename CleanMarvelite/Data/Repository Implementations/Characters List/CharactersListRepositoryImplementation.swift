//
//  CharactersListRepositoryImplementation.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public class CharactersListRepositoryImpl: CharactersListRepository {

    private let charactersRemoteDataSource: CharactersListRemoteDataSource
    private let mapper: CharacterMapper
    
    public init(charactersRemoteDataSource: CharactersListRemoteDataSource,
                mapper: CharacterMapper) {
        self.charactersRemoteDataSource = charactersRemoteDataSource
        self.mapper = mapper
    }

    public func getCharacters() async throws -> [CharacterEntity] {
        let characters = try await charactersRemoteDataSource.getCharacters()
        return characters.compactMap { mapper.map(from: $0) }
    }
}
