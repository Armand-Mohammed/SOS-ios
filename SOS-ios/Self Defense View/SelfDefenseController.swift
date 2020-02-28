//
//  SelfDefenseController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 10/5/19.
//  Copyright © 2019 sos. All rights reserved.
//

import UIKit
import WebKit

class SelfDefenseController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    //UINavigationControllerDelegate, UIWebViewDelegate, WKNavigationDelegate,

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        webView.navigationDelegate = self
        
        let myURL = URL(string: "https://www.youtube.com/channel/UCsE_m2z1NrvF2ImeNWh84mw")!
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
//        webView.allowsBackForwardNavigationGestures = true
    }

}
