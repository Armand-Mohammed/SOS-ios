//
//  UserProfileHeader.swift
//  SOS-ios
//
//  Created by Randy Hattab on 4/18/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit

class UserProfileHeader: UICollectionViewCell {
    
    // For User Image
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "randy")
        return imageView
    }()
    
    // User Info Area
    // For user's Name
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: Randy"
        //label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

    // For User Bio
    let userBioLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio: This is some info about myself"
        label.numberOfLines = 0
        return label
    }()
    // End User Info Area
    
    let friendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Friend", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor.mainBlue()
        button.layer.cornerRadius = 0
        return button
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor.mainBlue()
        button.layer.cornerRadius = 0
        return button
    }()
    
    // Buttons for bottom toolbar
    // Workouts Button
    lazy var workoutsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ProfileIconDark"), for: .normal) // Change to a arm muscle picture
        button.tintColor = UIColor.mainBlue()
        button.addTarget(self, action: #selector(handleChangeToWorkoutsView), for: .touchUpInside)
        return button
    }()
    
    @objc func handleChangeToWorkoutsView() {
        print("Changing to Workouts View")
        workoutsButton.tintColor = .mainBlue()
        personalTrainerButton.tintColor = UIColor(white: 0, alpha: 0.2)
        statsButton.tintColor = UIColor(white: 0, alpha: 0.2)
    }
    
    // Reviews Button
    lazy var personalTrainerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "MessageIconDark"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        button.addTarget(self, action: #selector(handleChangeToPersonalTrainerView), for: .touchUpInside)
        return button
    }()
    
    @objc func handleChangeToPersonalTrainerView() {
        print("Changing to Peronal Trianer View")
        personalTrainerButton.tintColor = .mainBlue()
        workoutsButton.tintColor = UIColor(white: 0, alpha: 0.2)
        statsButton.tintColor = UIColor(white: 0, alpha: 0.2)
    }
    
    // Stats Button
    lazy var statsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "DumbbellIconDark"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        button.addTarget(self, action: #selector(handleChangeToStatsView), for: .touchUpInside)
        return button
    }()
    
    @objc func handleChangeToStatsView() {
        print("Changing to Stats View")
        personalTrainerButton.tintColor =  UIColor(white: 0, alpha: 0.2)
        workoutsButton.tintColor = UIColor(white: 0, alpha: 0.2)
        statsButton.tintColor = .mainBlue()
    }
    // End Bottom toolbar buttoms
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
        setupBottomToolbar()
    }
    
    fileprivate func setupView() {
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: 0, height: frame.width)
        profileImageView.clipsToBounds = true
        
        addSubview(userNameLabel)
        userNameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 14, paddingLeft: 12, paddingBotton: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(userBioLabel)
        userBioLabel.anchor(top: userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setupBottomToolbar() {
        
        let topDividerView = UIView()
        topDividerView.backgroundColor = .lightGray
        
        let bottomDividerView = UIView()
        bottomDividerView.backgroundColor = .lightGray
        
        let stackView = UIStackView(arrangedSubviews: [workoutsButton, personalTrainerButton, statsButton])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        addSubview(topDividerView)
        addSubview(bottomDividerView)
        
        stackView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: 0, height: 50)
        
        topDividerView.anchor(top: stackView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: 0, height: 0.5)
        
        bottomDividerView.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
