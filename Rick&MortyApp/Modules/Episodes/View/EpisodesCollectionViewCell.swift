//
//  EpisodesCollectionViewCell.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 06.11.2023.
//

import UIKit

class EpisodesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Parameters
//    private let mainImageView = UIImageView()
//    private let nameTitle = UISearchBar()
//    
//    private lazy var filterButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor(named: "grayBlue")
//        button.layer.cornerRadius = 4
//        button.setTitle("ADVANCED FILTERS", for: .normal)
//        return button
//    }()
//    private lazy var episodesCollectionView: UICollectionView = {
//        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        view.backgroundColor = .yellow
//        return view
//    }()
    
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
        contentView.backgroundColor = .green
//        addSubview(mainImageView)
//        addSubview(nameTitle)
//        addSubview(filterButton)
//        addSubview(episodesCollectionView)
    }
    
    private func setConstraints() {
//        mainImageView.translatesAutoresizingMaskIntoConstraints = false
//        nameTitle.translatesAutoresizingMaskIntoConstraints = false
//        filterButton.translatesAutoresizingMaskIntoConstraints = false
//        episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 57),
//            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
//            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
            
//        ])
    }
}
