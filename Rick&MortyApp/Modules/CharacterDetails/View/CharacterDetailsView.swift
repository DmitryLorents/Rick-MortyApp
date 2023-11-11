//
//  CharacterDetailsView.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class CharacterDetailsView: UIView {
    //MARK: - Parameters
    private let characterImageView = {
        let view = UIImageView(image: UIImage(named: "person"))
        view.clipsToBounds = true
        return view
    }()
    private let cameraImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "camera"))
        let tapGestureRecognizer = UITapGestureRecognizer(target: nil, action: #selector(changePhoto))
        view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Rick Sanchez"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    private lazy var detailsTableView: UITableView = {
        let view = UITableView()
        view.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.reuseId)
        view.estimatedRowHeight = 64
        view.rowHeight = UITableView.automaticDimension
        view.tableHeaderView = headerTitle
        
        return view
    }()
    private let headerTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 24, width: 0, height: 24+16))
        label.text = "Informations"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .secondaryLabel
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
        setNeedsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImageView.layer.cornerRadius = characterImageView.bounds.height / 2
    }
    //MARK: - Methods
    private func setViews() {
        backgroundColor = .systemBackground
        addSubview(characterImageView)
        addSubview(cameraImageView)
        addSubview(nameLabel)
        addSubview(detailsTableView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: nil, action: #selector(changePhoto))
        cameraImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setDelegates(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        detailsTableView.dataSource = dataSource
        detailsTableView.delegate = delegate
    }
    
    private func setConstraints() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
            characterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            characterImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            cameraImageView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 9),
            cameraImageView.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor),
            cameraImageView.heightAnchor.constraint(equalToConstant: 32),
            cameraImageView.widthAnchor.constraint(equalToConstant: 32),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 48),
            
            detailsTableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 18),
            detailsTableView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            detailsTableView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            detailsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    //MARK: - Button actions
    @objc func changePhoto() {
        print("Change photo")
    }
}
