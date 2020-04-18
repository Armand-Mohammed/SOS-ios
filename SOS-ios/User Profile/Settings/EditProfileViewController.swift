//
//  EditProfileViewController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 1/11/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit
import AVFoundation
//import MobileCoreServices

class EditProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 4
        iv.image = UIImage(named: "Randy")
        return iv
    }()
    
    let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Profile Photo", for: .normal)
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.rgb(red: 17, green: 154, blue: 237), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleChangePhotoButton), for: .touchUpInside)
        return button
    }()
    
    @objc func handleChangePhotoButton() {
        print("Choose Profile Picture Selected")
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        // Fix this
        //imagePickerController.mediaTypes = [kUTTypeImage as String]
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profileImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    let emailTextField: UITextField = {
        let email = UITextField()
        email.backgroundColor = UIColor(white: 0, alpha: 0.03)
        email.borderStyle = .roundedRect
        email.font = UIFont.systemFont(ofSize: 14)
        email.autocapitalizationType = .none
        email.keyboardType = .emailAddress
        email.textContentType = .emailAddress
        email.returnKeyType = .next
        
        email.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return email
    }()
    
    @objc func handleTextInputChange() {
        let isFormValid = emailTextField.text?.isEmpty == false
        
        if isFormValid {
            print("Form valid")
            //            loginButton.isEnabled = true
            //            loginButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
            //            loginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
            //            loginButton.layer.shadowRadius = 3
            //            loginButton.layer.shadowOpacity = 0.5
        } else {
            print("Form invalid")
            //            loginButton.isEnabled = false
            //            loginButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
            //            loginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
            //            loginButton.layer.shadowRadius = 0
            //            loginButton.layer.shadowOpacity = 0
        }
    }
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Randy Hattab"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "randy.hattab@lanysta.com"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        populateTextFields()
        
        // Watching for touch out of keyboard to remove keyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: view.frame.width/3, height: view.frame.width/3)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(changePhotoButton)
        changePhotoButton.anchor(top: profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBotton: 0, paddingRight: 0, width: 0, height: 0)
        changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let inputStackView = UIStackView(arrangedSubviews: [emailTextField])
        
        inputStackView.distribution = .fillEqually
        inputStackView.axis = .vertical
        inputStackView.spacing = 10
        
        view.addSubview(inputStackView)
        // Auto Layout
        inputStackView.anchor(top: changePhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBotton: 0, paddingRight: 20, width: 0, height: 30)
        
        emailTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func populateTextFields() {
        // User Data Stuff
        //let userData = Users()
        //emailTextField.text = "\(String(describing: userData?._email))"
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("Keyboard has Appeared")
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        print("Keyboard has Disappeared")
    }
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        switch textField {
    //        case ConfirmationTextField:
    //            ConfirmationTextField.resignFirstResponder()
    //            handleConfirm()
    //        default:
    //            self.resignFirstResponder()
    //        }
    //        return true
    //    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
