//
//  SettingsViewController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 1/8/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit

// AWS needs to be imported
//import AWSMobileClient

private let reuseIdentifier = "SettingsCell"

class SettingsViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper Functions
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
    
    func configureUI() {
        configureTableView()
        
        navigationItem.title = "Settings"
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingsSection(rawValue: section) else { return 0 }
        
        switch section {
        case .Social: return SocialOptions.allCases.count
        case .Communications: return CommunicationOptions.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        
        print("Section is \(section)")
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .white
        title.text = SettingsSection(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .Social:
            let social = SocialOptions(rawValue: indexPath.row)
            cell.sectionType = social
        case .Communications:
            let communications = CommunicationOptions(rawValue: indexPath.row)
            cell.sectionType = communications
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = SettingsSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .Social:
            print(SocialOptions(rawValue: indexPath.row)?.description as Any)
            if indexPath.row == 0 {
                let editProfileViewController = EditProfileViewController()
                navigationController?.pushViewController(editProfileViewController, animated: true)
            } else if indexPath.row == 1 {
                let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                
                alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
                    
                    // create the alert
                    let alert = UIAlertController(title: "Are you sure?", message: "", preferredStyle: UIAlertController.Style.alert)
                    // add the actions (buttons)
                    alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler: { (_) in
                        print("Signed Out")
                        
                        
                        //////
                        // Log in and Log out stuff with AWS
                        /////
                        
                        // Log User Out
                        //AWSMobileClient.sharedInstance().signOut()
                        
                        // What happens? We need to present some kind of login controller
                        //let loginController = LoginController()
                        //let navController = UINavigationController(rootViewController: loginController)
                        //self.present(navController, animated: true, completion: nil)
                    }))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }))
                
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                present(alertController, animated: true, completion: nil)
            }
        case .Communications:
            print(CommunicationOptions(rawValue: indexPath.row)?.description as Any)
        }
    }
}
