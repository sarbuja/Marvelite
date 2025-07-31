//
//  ComicsListRemoteDataSource.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

public protocol ComicsListRemoteDataSource {
    func getComics() async throws -> [ComicsEntity]
}

public class ComicsListRemoteDataSourceImpl: ComicsListRemoteDataSource {

    private let request: URLRequest?
    
    public init(request: URLRequest?) {
        self.request = request
    }
    
    public func getComics() async throws -> [ComicsEntity] {

        guard let request = request else { throw APIError.invalidRequest }

        let (data, response) = try await URLSession.shared.data(for: request)

        if let urlResponse = response as? HTTPURLResponse {
            if !((200..<300) ~= urlResponse.statusCode) {
                throw APIError.statusCode(urlResponse.statusCode)
            }
        }

        let object = try JSONDecoder().decode(ComicsResponse.self, from: data)
        return object.comics
    }
}
