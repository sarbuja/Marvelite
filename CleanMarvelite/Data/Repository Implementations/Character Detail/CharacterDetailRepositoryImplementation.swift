//
//  CharacterDetailRepositoryImplementation.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public class CharacterDetailRepositoryImpl: CharacterDetailRepository {

    private let characterDetailRemoteDataSource: CharacterDetailRemoteDataSource
    private let mapper: CharacterMapper
    
    public init(characterDetailRemoteDataSource: CharacterDetailRemoteDataSource,
                mapper: CharacterMapper) {
        self.characterDetailRemoteDataSource = characterDetailRemoteDataSource
        self.mapper = mapper
    }

    public func getCharacterDetail() async throws -> CharacterEntity {
        let characterDTO = try await characterDetailRemoteDataSource.getCharacterDetail()
        return mapper.map(from: characterDTO)
    }
}
