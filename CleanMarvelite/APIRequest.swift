//
//  APIRequest.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

enum Constants {
    static let publicKey = "50b05f02bce382d8b899d739a9937afb"
    static let privateKey = "510911302595ca8b8f2585cb6dc3f84b7d169489"
}

enum RequestType: String {
    case get = "GET"
}

protocol APIRequest {
    var baseUrl: String { get }
    var path: String { get }
    var method: RequestType { get }
    var parameters: [String: String] { get }
}

extension APIRequest {
    
    var urlRequest: URLRequest? {
        guard var components = URLComponents(string: "\(baseUrl)\(path)") else {
            return nil
        }
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
    
    var parameters: [String : String] {
        return ["ts": timeStamp,
                "apikey": Constants.publicKey,
                "hash": keyCombo.md5()]
    }
    
    private var timeStamp: String {
        return String(Int(Date().timeIntervalSince1970))
    }
    
    private var keyCombo: String {
        return "\(timeStamp)\(Constants.privateKey)\(Constants.publicKey)"
    }
}

struct CharactersListRequest: APIRequest {
    
    var baseUrl: String {
        return "https://gateway.marvel.com/v1/public/"
    }
    
    var path: String {
        return "characters"
    }
    
    var method: RequestType {
        return .get
    }
}

struct ComicsListRequest: APIRequest {
    
    var baseUrl: String {
        return "https://gateway.marvel.com/v1/public/"
    }
    
    var path: String {
        return "comics"
    }
    
    var method: RequestType {
        return .get
    }
}

struct CharacterDetailRequest: APIRequest {
    
    private let characterId: Int
    
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    var baseUrl: String {
        return "https://gateway.marvel.com/v1/public/"
    }
    
    var path: String {
        return "characters/\(characterId)"
    }
    
    var method: RequestType {
        return .get
    }
}
