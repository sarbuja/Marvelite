//
//  ComicsListRepositoryImplementation.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

public class ComicsListRepositoryImplementation: ComicsListRepository {

    private let comicsRemoteDataSource: ComicsListRemoteDataSource
//    private let mapper: ComicsMapper
    
    public init(comicsRemoteDataSource: ComicsListRemoteDataSource) {
        self.comicsRemoteDataSource = comicsRemoteDataSource
//        self.mapper = mapper
    }

    public func getComics() async throws -> [ComicsEntity] {
        return try await comicsRemoteDataSource.getComics()
//        return comics.compactMap { mapper.map(from: $0) }
    }
}
