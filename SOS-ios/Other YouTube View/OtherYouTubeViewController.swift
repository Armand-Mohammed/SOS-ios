//
//  OtherYouTubeViewController.swift
//  SOS-ios
//
//  Created by Randy Hattab on 1/10/20.
//  Copyright © 2020 sos. All rights reserved.
//

import UIKit
import WebKit

class OtherYouTubeViewController: UIViewController, UINavigationControllerDelegate, UIWebViewDelegate, WKNavigationDelegate {
    
    //var webView: WKWebView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView()
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let url = URL(string: "https://www.youtube.com/channel/UCsE_m2z1NrvF2ImeNWh84mw")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
