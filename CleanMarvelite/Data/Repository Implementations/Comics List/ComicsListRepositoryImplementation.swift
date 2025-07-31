//
//  ComicsListRepositoryImplementation.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public class ComicsListRepositoryImplementation: ComicsListRepository {

    private let comicsRemoteDataSource: ComicsListRemoteDataSource

    public init(comicsRemoteDataSource: ComicsListRemoteDataSource) {
        self.comicsRemoteDataSource = comicsRemoteDataSource
    }

    public func getComics() async throws -> [ComicsEntity] {
        return try await comicsRemoteDataSource.getComics()
    }
}
