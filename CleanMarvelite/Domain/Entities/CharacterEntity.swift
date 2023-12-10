//
//  CharacterEntity.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

public struct CharacterEntity {
    public let id: Int
    public let name: String?
    public let description: String?
    public let thumbnailUrl: URL?
    public let comicsNames: [String]?
    public let webUrl: URL?
}
