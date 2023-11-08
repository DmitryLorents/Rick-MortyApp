//
//  EpisodesView.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 06.11.2023.
//

import UIKit

final class EpisodesView: UIView {
//MARK: - Parameters
    private let logoImageView = UIImageView(image: UIImage(named: "logo"))
    private let episodesSearchBar = UISearchBar()
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "grayBlue")
        button.layer.cornerRadius = 4
        button.setTitle("ADVANCED FILTERS", for: .normal)
        return button
    }()
    private lazy var episodesCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .yellow
        view.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: EpisodesCollectionViewCell.reuseId)
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
        addSubview(logoImageView)
        addSubview(episodesSearchBar)
        addSubview(filterButton)
        addSubview(episodesCollectionView)
    }
    
    func setDelegates(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        episodesCollectionView.dataSource = dataSource
        episodesCollectionView.delegate = delegate
    }
    
    private func setConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        episodesSearchBar.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 57),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            episodesSearchBar.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 67),
            episodesSearchBar.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            episodesSearchBar.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor),
            episodesSearchBar.heightAnchor.constraint(equalToConstant: 56),
            
            filterButton.topAnchor.constraint(equalTo: episodesSearchBar.bottomAnchor, constant: 12),
            filterButton.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            filterButton.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor),
            filterButton.heightAnchor.constraint(equalTo: episodesSearchBar.heightAnchor),
            
            episodesCollectionView.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 30),
            episodesCollectionView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            episodesCollectionView.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor),
            episodesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
