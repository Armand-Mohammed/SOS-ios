//
//  TimerViewController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 12/31/19.
//  Copyright © 2019 sos. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView()
    
    let startTimerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        button.layer.cornerRadius = 40
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    @objc func handleStartButton() {
        pickerView.isHidden = true
        
        countdownLabel.isHidden = false
        imOkayButton.isHidden = false
        sendAlertButton.isHidden = false
    }
    
    let stopTimerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Stop", for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 40
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleStopButton), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    @objc func handleStopButton() {
        pickerView.isHidden = false
        
        countdownLabel.isHidden = true
        imOkayButton.isHidden = true
        sendAlertButton.isHidden = true
    }
    
    let countdownLabel: UILabel = {
        let label = UILabel()
        label.text = "3:45"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    let imOkayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send Alert", for: .normal)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleImOkayButton), for: .touchUpInside)
        button.isEnabled = true
        button.isHidden = true
        return button
    }()
    
    @objc func handleImOkayButton() {
        print("I'm Okay. Notifying emergency contacts...")
    }
    
    let sendAlertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send Alert", for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleHelpButton), for: .touchUpInside)
        button.isEnabled = true
        button.isHidden = true
        return button
    }()
    
    @objc func handleHelpButton() {
        print("Help. Notifying emergency contacts...")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setupView()
    }
    
    func setupView() {
        pickerView.delegate = (self as UIPickerViewDelegate)
        pickerView.dataSource = (self as UIPickerViewDataSource)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickerView)
        pickerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBotton: 0, paddingRight: 16, width: 0, height: 0)
        
        view.addSubview(startTimerButton)
        startTimerButton.anchor(top: pickerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBotton: 0, paddingRight: 16, width: 80, height: 80)
        
        view.addSubview(stopTimerButton)
        stopTimerButton.anchor(top: pickerView.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBotton: 0, paddingRight: 16, width: 80, height: 80)
        
        view.addSubview(countdownLabel)
        countdownLabel.anchor(top: pickerView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: pickerView.frame.height / 2, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: view.frame.width, height: 100)
        
        let actionsStackView = UIStackView(arrangedSubviews: [imOkayButton, sendAlertButton])

        actionsStackView.axis = .horizontal
        actionsStackView.spacing = 10
        actionsStackView.distribution = .fillEqually

        view.addSubview(actionsStackView)

        actionsStackView.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBotton: 0, paddingRight: 16, width: 0, height: 50)
        
        let hoursLabel = UILabel()
        hoursLabel.text = "hours"
        hoursLabel.font = UIFont.systemFont(ofSize: 16)
        hoursLabel.sizeToFit()
        hoursLabel.frame = CGRect(x: pickerView.frame.width * 0.25, y: pickerView.frame.height * 0.5 - (hoursLabel.frame.height / 2.0), width: hoursLabel.frame.width, height: hoursLabel.frame.height)
        pickerView.addSubview(hoursLabel)
        
        let minLabel = UILabel()
        minLabel.text = "min"
        minLabel.font = UIFont.systemFont(ofSize: 16)
        minLabel.sizeToFit()
        minLabel.frame = CGRect(x: pickerView.frame.width * 0.65, y: pickerView.frame.height * 0.5 - (minLabel.frame.height / 2.0), width: minLabel.frame.width, height: minLabel.frame.height)
        pickerView.addSubview(minLabel)
        
        let secLabel = UILabel()
        secLabel.text = "sec"
        secLabel.font = UIFont.systemFont(ofSize: 16)
        secLabel.sizeToFit()
        secLabel.frame = CGRect(x: pickerView.frame.width * 0.97, y: pickerView.frame.height * 0.5 - (secLabel.frame.height / 2.0), width: secLabel.frame.width, height: secLabel.frame.height)
        pickerView.addSubview(secLabel)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        case 2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        case 2:
            return "\(row)"
        default:
            return "Error"
        }
    }
}
