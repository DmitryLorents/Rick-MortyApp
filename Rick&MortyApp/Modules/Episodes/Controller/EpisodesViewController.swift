//
//  EpisodesViewController.swift
//  Rick&Morty
//
//  Created by Dmitry on 06.11.2023.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    //MARK: - Propperties
    let mainView = EpisodesView()
    let networkManager = NetworkManager.shared
    private var episodes: [Results]? {
        didSet {
            mainView.reloadCollection()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        getEpisodes()
    }
    
    //MARK: - Methods
    private func setViews() {
        view = mainView
        mainView.setDelegates(dataSource: self, delegate: self)
    }
    
    private func getEpisodes() {
        networkManager.getEpisodes { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.episodes = success.results
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    @objc func heartButtonPressed() {
        print("Heart pressed")
    }
}
//MARK: - CollectionView setup

extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            navigationController?.pushViewController(CharacterDetailsViewController(), animated: true)
        }
    
    //MARK: - FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width - (24*2), height: (view.bounds.width - (24*2) ) * (357.0 / 311.0) )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        55
    }
}

extension EpisodesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCollectionViewCell.reuseId, for: indexPath) as? EpisodesCollectionViewCell else { return .init() }
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(heartButtonPressed))
        cell.setHeartAction(tapGestureRecognizer: tapGestureRecognizer)
        if let episode = episodes?[indexPath.item] {
            cell.setupCell(with: episode)
        }
        return cell
    }
    
    
}
