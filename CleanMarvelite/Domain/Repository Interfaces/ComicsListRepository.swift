//
//  ComicsListRepository.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public protocol ComicsListRepository {
    func getComics() async throws -> [ComicsEntity]
}
