//
//  CharactersListRemoteDataSource.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

public protocol CharactersListRemoteDataSource {
    func getCharacters() async throws -> [CharacterEntity]
}

public class CharactersRemoteDataSourceImpl: CharactersListRemoteDataSource {

    private let request: URLRequest?
    
    public init(request: URLRequest?) {
        self.request = request
    }
    
    public func getCharacters() async throws -> [CharacterEntity] {

        guard let request = request else { throw APIError.invalidRequest }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let urlResponse = response as? HTTPURLResponse,
              (200..<300) ~= urlResponse.statusCode else {
            throw APIError.statusCodeFail
        }
        let result = try JSONDecoder().decode(CharactersResponse.self, from: data)
        return result.characters
    }
}
