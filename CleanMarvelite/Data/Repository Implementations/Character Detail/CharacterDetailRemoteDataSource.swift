//
//  CharacterDetailRemoteDataSource.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

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
        
        if let urlResponse = response as? HTTPURLResponse {
            if !((200..<300) ~= urlResponse.statusCode) {
                throw APIError.statusCode(urlResponse.statusCode)
            }
        }

        let object = try JSONDecoder().decode(CharactersResponse.self, from: data)

        guard let character = object.characters.first else {
            throw APIError.noData
        }
        return character
    }
}
