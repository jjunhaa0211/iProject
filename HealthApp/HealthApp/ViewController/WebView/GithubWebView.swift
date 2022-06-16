//
//  GithubWebView.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/16.
//

import UIKit
import WebKit

class GithubWebView : UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    
    
    @IBOutlet weak var webView2: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        webView2 = WKWebView(frame: self.view.frame)
        webView2.uiDelegate = self
        webView2.navigationDelegate = self
        self.view = self.webView2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://github.com/jjunhaa0211")
        
        let request = URLRequest(url: url!)
        
        webView2.configuration.preferences.javaScriptEnabled = true
        
        webView2.load(request)
    }
    
    
}
