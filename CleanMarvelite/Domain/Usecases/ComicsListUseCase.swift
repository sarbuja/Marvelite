//
//  ComicsListUseCase.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public protocol ComicsListUseCase {
    func fetchComics() async throws -> [ComicsEntity]
}

public class ComicsListUseCaseImpl: ComicsListUseCase {

    private let comicsRepository: ComicsListRepository

    public init(comicsRepository: ComicsListRepository) {
        self.comicsRepository = comicsRepository
    }

    public func fetchComics() async throws -> [ComicsEntity] {
        return try await comicsRepository.getComics()
    }
}
