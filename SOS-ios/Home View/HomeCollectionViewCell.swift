//
//  HomeCollectionViewCell.swift
//  SOS-ios
//
//  Created by Randy Hattab on 10/5/19.
//  Copyright © 2019 sos. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        
        backgroundColor = .white
        
        self.layer.cornerRadius = 5
        
        addSubview(cellLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cellLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: cellLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
