//
//  CharacterMapper.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 27/10/2021.
//

import Foundation

public struct CharacterMapper {
    
    public func map(from input: CharacterDTO) -> CharacterEntity {
        CharacterEntity(
            id: input.id,
            name: input.name,
            description: input.description,
            thumbnailUrl: input.thumbnailUrl,
            comicsNames: input.comics?.map { $0.name },
            webUrl: input.webUrl
        )
    }
}
