//
//  LaunchScreenViewController.swift
//  Rick&Morty
//
//  Created by Dmitry on 06.11.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    //MARK: - Propperties
    let mainView = LaunchView()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        goToNextVC()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainView.stopAnimation()
    }
    
    //MARK: - Methods
    private func setViews() {
        view = mainView
        mainView.backgroundColor = .systemBackground
    }
    
    private func goToNextVC() {
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: DispatchWorkItem(block: {
            let tabBarVC = UINavigationController(rootViewController: TabBar())
            tabBarVC.modalPresentationStyle = .fullScreen
            self.present(tabBarVC, animated: true)
        }))
    }
    

}
