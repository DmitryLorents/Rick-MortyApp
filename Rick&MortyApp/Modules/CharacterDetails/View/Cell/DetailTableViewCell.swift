//
//  DetailTableViewCell.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {
    
    //MARK: - Parameters
    static let reuseId = String(describing: DetailTableViewCell.self)
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "Main text"
        return label
    }()
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "Comment text"
        return label
    }()
    
    
    
   
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    //MARK: - Methods
    
    func setupCell(with mainTitle: String?, _ detailTitle: String?) {
        mainLabel.text = mainTitle
        detailLabel.text = detailTitle
    }
    private func setViews() {
        contentView.addSubview(mainLabel)
        contentView.addSubview(detailLabel)
    }
    
    private func setConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            
            detailLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 0),
            detailLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
            
        ])
    }
}
