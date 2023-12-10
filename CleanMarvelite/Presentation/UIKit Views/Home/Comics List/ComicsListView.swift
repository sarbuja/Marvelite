//
//  ComicsListView.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

class ComicsListView: UIView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var comicsCollection: UICollectionView!

    var presenter: ComicsListPresenter?

    var themeManager: ThemeManager? {
        didSet {
            guard let themeManager = themeManager else { return }
            setStyle(themeManager.comicsListStyle)
        }
    }
    
    func setupPresenter(_ presenter: ComicsListPresenter?) async throws {
        self.presenter = presenter
        try await presenter?.getComics()
        setupTitle()
        comicsCollection.reloadData()
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
        let nib = UINib(nibName: "ComicsListView", bundle: Bundle(for: ComicsListView.self))
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
        let nib = UINib(nibName: "ComicsListCollectionViewCell", bundle: Bundle(for: ComicsListCollectionViewCell.self))
        comicsCollection?.register(nib, forCellWithReuseIdentifier: "ComicsListCollectionViewCell")
        comicsCollection?.delegate = self
        comicsCollection?.dataSource = self
    }
}

extension ComicsListView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicsListCollectionViewCell", for: indexPath) as? ComicsListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setStyle(themeManager?.comicsListStyle.cellStyle)
        presenter?.configureCell(cell, at: indexPath.row)
        return cell
    }
}

extension ComicsListView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.presentComicWebLink(at: indexPath.row)
    }
}

extension ComicsListView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: collectionView.frame.height - 100)
    }
}

extension ComicsListView {
    
    struct Style {
        let backgroundColor: UIColor
        let titleStyle: UILabel.Style
        let subtitleStyle: UILabel.Style
        let cellStyle: ComicsListCollectionViewCell.Style
    }
    
    private func setStyle(_ style: Style) {
        backgroundColor = style.backgroundColor
        titleLabel?.style(using: style.titleStyle)
        summaryLabel?.style(using: style.subtitleStyle)
    }
}
