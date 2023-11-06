//
//  TabBar.swift
//  Rick&Morty
//
//  Created by Dmitry on 06.11.2023.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewControllers()
    }
    
    private func setViewControllers() {
        //episodes
        let episodesVC = EpisodesViewController()
        let episodesUnselectedImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        let episodesSelectedImage = UIImage(named: "homeFill")?.withRenderingMode(.alwaysOriginal)
        let episodesItem = UITabBarItem(title: nil, image: episodesUnselectedImage, selectedImage: episodesSelectedImage)
        episodesVC.tabBarItem = episodesItem
        //favorites
        let favoritesVC = FavoritesViewController()
        
        
        viewControllers = [episodesVC]
    }
}
