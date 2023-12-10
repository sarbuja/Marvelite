//
//  ComicsDTO.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

//import Foundation
//
//struct ComicsResponse: Decodable {
//    let comics: [ComicsDTO]
//
//    enum CodingKeys: String, CodingKey {
//        case data
//    }
//
//    enum DataKeys: String, CodingKey {
//        case results
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        let results = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
//        comics = try results.decode([ComicsDTO].self, forKey: .results)
//    }
//}

//public struct ComicsDTO: Decodable {
//    let id: Int
//    let title: String
//    let description: String?
//    let thumbnailUrl: URL?
//    let prices: [Price]?
//    let webUrl: URL?
//
//    struct Price: Decodable {
//        let type: String
//        let price: Double
//    }
//
//    struct WebUrl: Decodable {
//        let type: String
//        let url: String
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case description
//        case thumbnail
//        case prices
//        case urls
//    }
//
//    private enum ThumbnailKeys: String, CodingKey {
//        case path
//        case fileExtension = "extension"
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try container.decode(Int.self, forKey: .id)
//        title = try container.decode(String.self, forKey: .title)
//        description = try? container.decode(String.self, forKey: .description)
//        prices = try? container.decode([Price].self, forKey: .prices)
//
//        let thumbnailContainer = try? container.nestedContainer(keyedBy: ThumbnailKeys.self, forKey: .thumbnail)
//        let path = try? thumbnailContainer?.decode(String.self, forKey: .path)
//        let ext = try? thumbnailContainer?.decode(String.self, forKey: .fileExtension)
//        if let path = path,
//           let ext = ext,
//           let url = URL(string: "\(path).\(ext)") {
//            thumbnailUrl = url
//        } else {
//            thumbnailUrl = nil
//        }
//
//        let webUrls = try? container.decode([WebUrl].self, forKey: .urls)
//        if let first = webUrls?.first,
//           let url = URL(string: first.url) {
//            webUrl = url
//        } else {
//            webUrl = nil
//        }
//    }
//}
