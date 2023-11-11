//
//  FavoritesView.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 11.11.2023.
//

import UIKit

class FavoritesView: UIView {
    //MARK: - Parameters
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Favorites episodes"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
        
        private lazy var episodesCollectionView: UICollectionView = {
            let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
            view.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: EpisodesCollectionViewCell.reuseId)
            view.showsVerticalScrollIndicator = false
            return view
        }()
        
        //MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setViews()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        //MARK: - Methods
        private func setViews() {
            addSubview(titleLabel)
            addSubview(episodesCollectionView)
        }
        
        func setDelegates(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
            episodesCollectionView.dataSource = dataSource
            episodesCollectionView.delegate = delegate
        }
        
        private func setConstraints() {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
                
                
                episodesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 29),
                episodesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                episodesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
                episodesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                
            ])
        }
    }

