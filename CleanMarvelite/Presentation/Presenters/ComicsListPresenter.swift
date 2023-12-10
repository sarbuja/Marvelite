//
//  ComicsListPresenter.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

public protocol ComicsListCell: AnyObject {
    var title: String? { get set }
    var price: Double? { get set }
    var imageUrl: URL? { get set }
}

public protocol ComicsListPresenter {
    var title: String { get }
    var summary: String { get }
    func getComics() async throws
    var numberOfItems: Int { get }
    func presentComicWebLink(at index: Int)
    func configureCell(_ cell: ComicsListCell, at index: Int)
}

public class ComicsListPresenterImpl {

    private var comics: [ComicsEntity]?
    private let router: DisplayWeblinkRouter
    private var usecase: ComicsListUseCase
    
    public init(router: DisplayWeblinkRouter,
         usecase: ComicsListUseCase) {
        self.router = router
        self.usecase = usecase
    }
}

extension ComicsListPresenterImpl: ComicsListPresenter {

    public func getComics() async throws {
        comics = try await usecase.fetchComics()
    }
    
    public var title: String {
        return "Comics"
    }

    public var summary: String {
        return "These are the marvel comics displayed in the horizontal scroll format."
    }

    public var numberOfItems: Int {
        return comics?.count ?? 0
    }

    public func presentComicWebLink(at index: Int) {
        guard let webUrl = comics?[safe: index]?.webUrl else { return }
        router.presentWeblink(url: webUrl)
    }

    public func configureCell(_ cell: ComicsListCell, at index: Int) {
        guard let comics = comics?[safe: index] else { return }
        cell.title = comics.title
        cell.price = comics.price
        cell.imageUrl = comics.thumbnailUrl
    }
}
