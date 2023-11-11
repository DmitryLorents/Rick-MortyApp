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
        view.backgroundColor = .white
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
        let favoritesUnselectedImage = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        let favoritesSelectedImage = UIImage(named: "heartFill")?.withRenderingMode(.alwaysOriginal)
        let favoritesItem = UITabBarItem(title: nil, image: favoritesUnselectedImage, selectedImage: favoritesSelectedImage)
        favoritesVC.tabBarItem = favoritesItem
        
        
        
        viewControllers = [episodesVC, favoritesVC]
    }
}
