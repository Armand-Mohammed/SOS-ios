//
//  MainTabBarController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 4/18/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.delegate = self is for the photo picker
        self.delegate = self
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        let selfDefenseViewController = SelfDefenseController()
        selfDefenseViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let mapViewController = MapViewController()
        mapViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let userProfileLayout = UICollectionViewFlowLayout()
        let userProfileViewController = UserProfileViewController(collectionViewLayout: userProfileLayout)
        userProfileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let timerViewController = TimerViewController()
        timerViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)

        let tabBarList = [selfDefenseViewController, mapViewController, userProfileViewController, timerViewController, settingsViewController]

        viewControllers = tabBarList

        // Bottom Tab Bar
        tabBar.tintColor = .black

        // Modify Tab Bar Item Insets
        guard let items  = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
