//
//  HomeViewController.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

public class HomeViewController: UIViewController {
    
    @IBOutlet var comicsListView: ComicsListView!
    @IBOutlet var charactersListView: CharactersListView!

    private let charactersListPresenter: CharactersListPresenter
    private let comicsListPresenter: ComicsListPresenter
    private let themeManager: ThemeManager
    
    public init(charactersListPresenter: CharactersListPresenter,
                comicsListPresenter: ComicsListPresenter,
                theme: Themeable) {
        self.charactersListPresenter = charactersListPresenter
        self.comicsListPresenter = comicsListPresenter
        self.themeManager = ThemeManager(theme: theme)
        super.init(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = themeManager.primaryBackgroundColor
        setupNavigationTitle()
        setupCharactersView()
        setupComicsView()
    }

    private func setupNavigationTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
    }

    private func setupCharactersView() {
        Task {
            do {
                try await charactersListView.setupPresenter(charactersListPresenter)
            } catch {
                presentAlert(message: error.localizedDescription)
            }
        }
        charactersListView.themeManager = themeManager
    }
    
    private func setupComicsView() {
        Task {
            do {
                try await comicsListView.setupPresenter(comicsListPresenter)
            } catch {
                presentAlert(message: error.localizedDescription)
            }
        }
        comicsListView.themeManager = themeManager
    }
}
