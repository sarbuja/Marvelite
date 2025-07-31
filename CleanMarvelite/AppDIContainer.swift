//
//  AppDIContainer.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

final class AppDIContainer: DIContainer {

    static let shared = AppDIContainer()

    private init() {}

    func homeDependencies() -> HomeViewController {
        // Usecases
        let charactersRemoteDataSource = CharactersRemoteDataSourceImpl(request: CharactersListRequest().urlRequest)
        let charactersRepo = CharactersListRepositoryImpl(charactersRemoteDataSource: charactersRemoteDataSource)
        let charactersUseCase = CharactersListUseCaseImpl(charactersRepository: charactersRepo)

        let comicsRemoteDataSource = ComicsListRemoteDataSourceImpl(request: ComicsListRequest().urlRequest)
        let comicsRepo = ComicsListRepositoryImplementation(comicsRemoteDataSource: comicsRemoteDataSource)
        let comicsUseCase = ComicsListUseCaseImpl(comicsRepository: comicsRepo)

        // Router
        let charactersListRouter = CharactersListRouterImpl(appDIContainer: AppDIContainer.shared)
        let comicsListRouter = ComicsListRouterImpl(appDIContainer: AppDIContainer.shared)

        // Presenters
        let charactersPresenter = CharactersListPresenterImpl(
            router: charactersListRouter,
            usecase: charactersUseCase
        )
        let comicsPresenter = ComicsListPresenterImpl(
            router: comicsListRouter,
            usecase: comicsUseCase
        )

        // Controller
        let homeViewController = HomeViewController(
            charactersListPresenter: charactersPresenter,
            comicsListPresenter: comicsPresenter,
            theme: MainAppTheme()
        )
        charactersListRouter.viewController = homeViewController
        comicsListRouter.viewController = homeViewController
        
        return homeViewController
    }

    func characterDetailDependencies(id: Int) -> CharacterDetailViewController {
        // Usecase
        let detailRemoteDataSource = CharacterDetailRemoteDataSourceImpl(
            request: CharacterDetailRequest(characterId: id).urlRequest,
            client: HttpClient()
        )
        let detailRepo = CharacterDetailRepositoryImpl(characterDetailRemoteDataSource: detailRemoteDataSource)
        let usecase = CharacterDetailUseCaseImpl(characterDetailRepo: detailRepo)

        // Router
        let detailRouter = CharacterDetailRouterImpl(appDIContainer: AppDIContainer.shared)

        // Presenter
        let presenter = CharacterDetailPresenterImpl(
            router: detailRouter,
            usecase: usecase
        )

        // Controller
        let detailVC = CharacterDetailViewController(presenter: presenter, theme: MainAppTheme())
        detailRouter.viewController = detailVC
        return detailVC
    }
}
