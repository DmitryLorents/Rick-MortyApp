//
//  DetailTableViewCell.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .green
        setViews()
        setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }
    
    static let reuseId = String(describing: DetailTableViewCell.self)
    
    //MARK: - Parameters
    
    
    
    //MARK: - Init
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setViews()
//        setConstraints()
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    //MARK: - Methods
    private func setViews() {
        
    }
    
    private func setConstraints() {
        
        
       
        NSLayoutConstraint.activate([
            
            
            
        ])
    }
}
