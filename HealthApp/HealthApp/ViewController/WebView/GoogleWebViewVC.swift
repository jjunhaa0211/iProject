//
//  WebViewVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/16.
//

import UIKit
import WebKit

class WebViewVC : UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView(frame: self.view.frame)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = self.webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.co.kr/?client=safari&channel=iphone_bm")
        
        let request = URLRequest(url: url!)
        
        webView.configuration.preferences.javaScriptEnabled = true
        
        webView.load(request)
    }
    
    
}
