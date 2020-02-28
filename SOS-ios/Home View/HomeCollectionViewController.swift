//
//  HomeCollectionViewController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 10/5/19.
//  Copyright © 2019 sos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {
    
    let cellNames: [String] = ["Self Defense", "Police", "Timer", "Map", "Stalker Alert", "SOS 911"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        collectionView.dataSource = self
        collectionView.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.cellLabel.text = cellNames[indexPath.row]
    
        // Configure the cell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/2) - 30, height: (view.frame.height/3) - 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("Navigating to YouTube")
            let selfDefenseController = SelfDefenseController()
            self.navigationController?.pushViewController(selfDefenseController, animated: true)
        case 1:
            let viewController = ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            print("Something went wrong, default switch statement reached.")
        }
    }
    
}
