//
//  UserProfileViewController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 1/3/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UINavigationControllerDelegate {

    let topDividerView = UIView()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "randy")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 4
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let userBioLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Randy Hattab\n22\nText\nMore Text", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentVerticalAlignment = .top
        button.contentHorizontalAlignment = .left
        button.titleLabel?.lineBreakMode = .byCharWrapping
        button.autoresizingMask = .flexibleWidth
        button.autoresizesSubviews = true
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let profileWeightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight: 168.0"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let profileHeightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height: 5'7"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        setupView()
    }
    
    func setupNavBar() {
        
        navigationItem.title = "Profile"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(handleSettingsButton))
    }
    
    @objc func handleSettingsButton() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBotton: 0, paddingRight: 0, width: 75, height: 120)
        
        view.addSubview(userBioLabel)
        userBioLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBotton: 0, paddingRight: 16, width: 0, height: 100)
        
        let stackView = UIStackView(arrangedSubviews: [profileHeightLabel, profileWeightLabel])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.anchor(top: nil, left: profileImageView.rightAnchor, bottom: profileImageView.bottomAnchor, right: view.rightAnchor, paddingTop: 4, paddingLeft: 16, paddingBotton: 2, paddingRight: 16, width: 0, height: 15)
        
        view.addSubview(topDividerView)
        topDividerView.backgroundColor = .lightGray
        topDividerView.anchor(top: profileImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: 0, height: 0.5)
    }
}
