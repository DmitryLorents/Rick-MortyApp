//
//  EpisodesCollectionViewCell.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 06.11.2023.
//

import UIKit

class EpisodesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: EpisodesCollectionViewCell.self)
    
    //MARK: - Parameters
    
    private lazy var vStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "  Rick Sanchez"
        return label
    }()
    private var mainImageView = UIImageView()
    
    private let bottomGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "grayBottom")
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var hStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
//        stack.distribution = .equalSpacing
        stack.spacing = 11
        return stack
    }()
    
    private let monitorImageView = UIImageView(image: UIImage(named: "monitorPlay"))
    private let episodNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Pilot | S01E01"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private lazy var heartImageView = UIImageView(image: UIImage(named: "heartBold"))
    
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
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(vStack)
        vStack.addArrangedSubview(mainImageView)
        vStack.addArrangedSubview(cellTitle)
        vStack.addArrangedSubview(bottomGrayView)
        mainImageView.backgroundColor = .systemGray3
        bottomGrayView.addSubview(hStack)
        hStack.addArrangedSubview(monitorImageView)
        hStack.addArrangedSubview(episodNameLabel)
        hStack.addArrangedSubview(heartImageView)
    }
    
    private func setConstraints() {
        
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        bottomGrayView.translatesAutoresizingMaskIntoConstraints = false
        hStack.translatesAutoresizingMaskIntoConstraints = false
        monitorImageView.translatesAutoresizingMaskIntoConstraints = false
        episodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            vStack.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor),
            
            mainImageView.heightAnchor.constraint(equalTo: cellBackgroundView.widthAnchor, multiplier: (232.0 / 311.0)),
            bottomGrayView.heightAnchor.constraint(equalTo: cellBackgroundView.widthAnchor, multiplier: (71.0 / 311.0)),
            
            hStack.topAnchor.constraint(equalTo: bottomGrayView.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: bottomGrayView.bottomAnchor),
            hStack.leadingAnchor.constraint(equalTo: bottomGrayView.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: bottomGrayView.trailingAnchor, constant: -20),
            
            monitorImageView.heightAnchor.constraint(equalTo: hStack.heightAnchor, multiplier: (34.0 / 71.0)),
            monitorImageView.widthAnchor.constraint(equalTo: monitorImageView.heightAnchor, multiplier: (26.72 / 25.56)),
            heartImageView.heightAnchor.constraint(equalTo: hStack.heightAnchor, multiplier: (40.0 / 71.0)),
            heartImageView.widthAnchor.constraint(equalTo: heartImageView.heightAnchor, multiplier: (41.0 / 40.0))
            
        ])
    }
    
    func setHeartAction(tapGestureRecognizer: UITapGestureRecognizer) {
        heartImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
}
