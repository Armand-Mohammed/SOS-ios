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

        let fakeCallViewController = FakeCallViewController()
        fakeCallViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let userProfileViewController = UserProfileViewController()
        userProfileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let timerViewController = TimerViewController()
        timerViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        
        let otherYouTubeViewController = OtherYouTubeViewController()
        otherYouTubeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)

        let tabBarList = [selfDefenseViewController, fakeCallViewController, userProfileViewController, timerViewController, otherYouTubeViewController]

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
