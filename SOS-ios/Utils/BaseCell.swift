//
//  BaseCell.swift
//  SOS-ios
//
//  Created by Randy Hattab on 4/18/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        print("trying to setup views")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
