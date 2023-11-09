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
//MARK: - Datasource
extension CharacterDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reuseId, for: indexPath) as? DetailTableViewCell else {return .init()}
        return cell
    }
    
    
}
//MARK: - Delegate
extension CharacterDetailsViewController: UITableViewDelegate {
    
}
