//
//  CharactersListView.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

class CharactersListView: UIView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var charactersCollection: UICollectionView!

    var presenter: CharactersListPresenter?
    
    var themeManager: ThemeManager? {
        didSet {
            guard let themeManager = themeManager else { return }
            setStyle(themeManager.charactersListStyle)
        }
    }

    func setupPresenter(_ presenter: CharactersListPresenter?) async throws {
        self.presenter = presenter
        try await presenter?.fetchCharacters()
        setupTitle()
        charactersCollection.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let nib = UINib(nibName: "CharactersListView", bundle: Bundle(for: CharactersListView.self))
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = bounds
        addSubview(view)
        setupTitle()
        setupCollectionView()
    }

    private func setupTitle() {
        titleLabel?.text = presenter?.title
        summaryLabel?.text = presenter?.summary
    }

    private func setupCollectionView() {
        let nib = UINib(nibName: "CharactersListCollectionViewCell", bundle: Bundle(for: CharactersListCollectionViewCell.self))
        charactersCollection?.register(nib, forCellWithReuseIdentifier: "CharactersListCollectionViewCell")
        charactersCollection?.delegate = self
        charactersCollection?.dataSource = self
    }

}

extension CharactersListView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersListCollectionViewCell", for: indexPath) as? CharactersListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setStyle(themeManager?.charactersListStyle.cellStyle)
        presenter?.configureCell(cell, at: indexPath.row)
        return cell
    }
}

extension CharactersListView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.pushToCharacterDetail(at: indexPath.row)
    }
}

extension CharactersListView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: collectionView.frame.height - 100)
    }
}

extension CharactersListView {
    
    struct Style {
        let backgroundColor: UIColor
        let titleStyle: UILabel.Style
        let subtitleStyle: UILabel.Style
        let cellStyle: CharactersListCollectionViewCell.Style
    }
    
    private func setStyle(_ style: Style) {
        backgroundColor = style.backgroundColor
        titleLabel?.style(using: style.titleStyle)
        summaryLabel?.style(using: style.subtitleStyle)
    }
}
