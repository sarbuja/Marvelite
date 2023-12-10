//
//  CharacterDetailRepository.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public protocol CharacterDetailRepository {
    func getCharacterDetail() async throws -> CharacterEntity
}
