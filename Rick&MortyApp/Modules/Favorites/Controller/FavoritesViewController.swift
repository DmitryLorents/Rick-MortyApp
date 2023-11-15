//
//  FavoritesViewController.swift
//  Rick&Morty
//
//  Created by Dmitry on 06.11.2023.
//

import UIKit

final class FavoritesViewController: UIViewController {

    //MARK: - Propperties
    let mainView = FavoritesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()

        
    }
    
    //MARK: - Methods
    private func setViews() {
        view = mainView
        mainView.setDelegates(dataSource: self, delegate: self)
        
    }
}
//MARK: - CollectionView setup

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            navigationController?.pushViewController(CharacterDetailsViewController(character: nil), animated: true)
        }
    
    //MARK: - FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width - (24*2), height: (view.bounds.width - (24*2) ) * (357.0 / 311.0) )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        55
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCollectionViewCell.reuseId, for: indexPath) as? EpisodesCollectionViewCell else { return .init() }
        return cell
    }
    
    
}

