//
//  ViewController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 8/3/19.
//  Copyright © 2019 sos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

//        navigationController?.isNavigationBarHidden = false
        //setupNavBar()
        
        setupButtons()
    }
    
    func setupNavBar() {
        navigationItem.title = "Title"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleDismissView))
    }
    
    @objc func handleDismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupButtons() {
//        //personalSecurityButton
//        personalSecurityButton.layer.cornerRadius = 4
//        personalSecurityButton.layer.shadowOffset = CGSize(width: 0, height: 3)
//        personalSecurityButton.layer.shadowRadius = 3
//        personalSecurityButton.layer.shadowOpacity = 0.5
//
//        //fgcuPoliceButton
//        fgcuPoliceButton.layer.cornerRadius = 4
//        fgcuPoliceButton.layer.shadowOffset = CGSize(width: 0, height: 3)
//        fgcuPoliceButton.layer.shadowRadius = 3
//        fgcuPoliceButton.layer.shadowOpacity = 0.5
//
//        //safetyTimerButton
//        safetyTimerButton.layer.cornerRadius = 4
//        safetyTimerButton.layer.shadowOffset = CGSize(width: 0, height: 3)
//        safetyTimerButton.layer.shadowRadius = 3
//        safetyTimerButton.layer.shadowOpacity = 0.5
//
//        //locationAwarenessButton
//        locationAwarenessButton.layer.cornerRadius = 4
//        locationAwarenessButton.layer.shadowOffset = CGSize(width: 0, height: 3)
//        locationAwarenessButton.layer.shadowRadius = 3
//        locationAwarenessButton.layer.shadowOpacity = 0.5
//
//        //messagingButton
//        messagingButton.layer.cornerRadius = 4
//        messagingButton.layer.shadowOffset = CGSize(width: 0, height: 3)
//        messagingButton.layer.shadowRadius = 3
//        messagingButton.layer.shadowOpacity = 0.5
//
//        //socialMediaButton
//        socialMediaButton.layer.cornerRadius = 4
//        socialMediaButton.layer.shadowOffset = CGSize(width: 0, height: 3)
//        socialMediaButton.layer.shadowRadius = 3
//        socialMediaButton.layer.shadowOpacity = 0.5
    }


}

