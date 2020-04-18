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
        
        let firstViewController = self()
                
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let secondViewController = secondVC()

        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList

        // Search Controller
        //let fakeCallNavController =
            
            //templateNavController(unselectedImage: #imageLiteral(resourceName: "marketplaceOff"), selectedImage: #imageLiteral(resourceName: "marketplaceOn"), rootViewController: fake())

        // Workouts Controller
        //let selfDefenseNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "bicepOff"), selectedImage: #imageLiteral(resourceName: "bicepOn"),  rootViewController: ())

        // Profile Controller
        //let userProfileController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"),  rootViewController: UserProfileController())
        
        // Profile Controller
        //let timerController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"),  rootViewController: TimerViewVontroller())
        
        // Profile Controller
        //let youtubeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"),  rootViewController: otherYouTubeViewController())

        // Bottom Tab Bar
        tabBar.tintColor = .black

        //viewControllers = [SelfDefenseNavController]

        // Modify Tab Bar Item Insets
        guard let items  = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }

    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
