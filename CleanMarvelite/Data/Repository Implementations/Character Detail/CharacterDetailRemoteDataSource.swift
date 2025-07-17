//
//  CharacterDetailRemoteDataSource.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

public enum APIError: Error {
    case invalidRequest
    case statusCodeFail
    case noData
}

public protocol CharacterDetailRemoteDataSource {
    func getCharacterDetail() async throws -> CharacterEntity
}

public class CharacterDetailRemoteDataSourceImpl: CharacterDetailRemoteDataSource {

    private let request: URLRequest?
    private let client: HttpClient
    
    public init(request: URLRequest?, client: HttpClient) {
        self.request = request
        self.client = client
    }

    public func getCharacterDetail() async throws -> CharacterEntity {

        guard let request = request else { throw APIError.invalidRequest }
        
        let (data, response) = try await client.getResponse(from: request)
        
        guard let urlResponse = response as? HTTPURLResponse,
              (200..<300) ~= urlResponse.statusCode else {
            throw APIError.statusCodeFail
        }
        
        let decoder = JSONDecoder()
        let object = try decoder.decode(CharactersResponse.self, from: data)
        
        guard let character = object.characters.first else {
            throw APIError.noData
        }
        return character
    }
}
