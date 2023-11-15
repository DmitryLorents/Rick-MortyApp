//
//  CharacterDetailsViewController.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {
    //MARK: - Parameters
    let mainView = CharacterDetailsView()
    let cellTitles = CharacterDetailModel.cellTitles
    var character: CharacterData?

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setNavigationAppearance()
    }
    
    //MARK: - Init
    init(character: CharacterData?) {
        super.init(nibName: nil, bundle: nil)
        self.character = character
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - Methods
    
    private func setNavigationAppearance() {
        let buttonRight: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "logoBlack"), for: .normal)
            return button
        }()

        let buttonLeft: UILabel = {
            let button = UILabel()
            button.isUserInteractionEnabled = true
            button.text = "\u{2190} GO BACK"
            button.font = UIFont.boldSystemFont(ofSize: 18)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backAction))
            button.addGestureRecognizer(tapGesture)
            return button
        }()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
    }
    
    private func setViews() {
        view = mainView
        mainView.setDelegates(dataSource: self, delegate: self)
        mainView.setupView(with: character)
    }
    
    private func getDetailTitle(_ indexPath: IndexPath) -> String? {
        switch indexPath.row {
        case 0: return character?.gender
        case 1: return character?.status
        case 2: return character?.species
        case 3: return character?.origin.name
        case 4: return character?.type
        case 5: return character?.location.name
        default: return ""
        }
    }
    
    //MARK: - Button actions
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }

}
//MARK: - Datasource
extension CharacterDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reuseId, for: indexPath) as? DetailTableViewCell else {return .init()}
        let mainTitle = cellTitles[indexPath.row]
        let detailTitle = getDetailTitle(indexPath)
        cell.setupCell(with: mainTitle, detailTitle)
        return cell
    }
}
