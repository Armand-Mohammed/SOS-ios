//
//  UserProfileCell.swift
//  SOS-ios
//
//  Created by Randy Hattab on 4/18/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit

class UserProfileCell:  BaseCell {
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let workoutTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "User Info"
    label.textAlignment = .center
    return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(thumbnailImageView)
        addSubview(workoutTitleLabel)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: thumbnailImageView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: workoutTitleLabel)
        
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(20)]-16-|", views: thumbnailImageView, workoutTitleLabel)
    }
}
