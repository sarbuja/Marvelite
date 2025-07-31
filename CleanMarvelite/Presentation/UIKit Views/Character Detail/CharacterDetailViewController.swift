//
//  CharacterDetailViewController.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit
import SDWebImage

public class CharacterDetailViewController: UIViewController {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var weblinkButton: UIButton!

    private var presenter: CharacterDetailPresenter
    private let themeManager: ThemeManager

    public init(presenter: CharacterDetailPresenter, theme: Themeable) {
        self.presenter = presenter
        self.themeManager = ThemeManager(theme: theme)
        super.init(nibName: "CharacterDetailViewController", bundle: Bundle(for: CharacterDetailViewController.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        Task {
            do {
                try await presenter.fetchCharacter()
                displayCharacterDetail()
            } catch {
                presentAlert(message: error.localizedDescription)
            }
        }
    }

    private func displayCharacterDetail() {
        view.backgroundColor = themeManager.primaryBackgroundColor
        title = presenter.title
        titleLabel.text = presenter.title
        contentLabel.text = presenter.description
        descriptionLabel.text = presenter.comicsFeatured
        mainImageView.sd_setImage(with: presenter.imageUrl, placeholderImage: UIImage(named: "no_image_placeholder"))
    }
    
    @IBAction func weblinkTapped(_ sender: Any) {
        presenter.presentWebContent()
    }
}
