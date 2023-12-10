//
//  HttpClient.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 29/05/2023.
//

import Foundation

public class HttpClient {

    let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func getResponse(from request: URLRequest) async throws -> (Data, URLResponse) {
        try await urlSession.data(for: request)
    }
}
