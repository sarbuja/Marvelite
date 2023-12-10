//
//  CharactersListRepository.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public protocol CharactersListRepository {
    func getCharacters() async throws -> [CharacterEntity]
}
