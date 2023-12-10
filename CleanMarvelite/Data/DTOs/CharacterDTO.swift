//
//  CharacterDTO.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

struct CharactersResponse: Decodable {
    let characters: [CharacterDTO]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum DataKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let results = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        characters = try results.decode([CharacterDTO].self, forKey: .results)
    }
}

public struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let description: String?
    let thumbnailUrl: URL?
    let comics: [ComicItem]?
    let webUrl: URL?

    struct WebUrl: Decodable {
        let type: String
        let url: String
    }
    
    struct ComicItem: Decodable {
        let name: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
        case urls
    }
    
    private enum ThumbnailKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
    
    private enum ComicsKeys: String, CodingKey {
        case items
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try? container.decode(String.self, forKey: .description)
        
        let comicsContainer = try? container.nestedContainer(keyedBy: ComicsKeys.self, forKey: .comics)
        comics = try? comicsContainer?.decode([ComicItem].self, forKey: .items)
        
        let thumbnailContainer = try? container.nestedContainer(keyedBy: ThumbnailKeys.self, forKey: .thumbnail)
        let path = try? thumbnailContainer?.decode(String.self, forKey: .path)
        let ext = try? thumbnailContainer?.decode(String.self, forKey: .fileExtension)
        if let path = path,
           let ext = ext,
           let url = URL(string: "\(path).\(ext)") {
            thumbnailUrl = url
        } else {
            thumbnailUrl = nil
        }
        
        let webUrls = try? container.decode([WebUrl].self, forKey: .urls)
        if let first = webUrls?.first,
           let url = URL(string: first.url) {
            webUrl = url
        } else {
            webUrl = nil
        }
    }
}
