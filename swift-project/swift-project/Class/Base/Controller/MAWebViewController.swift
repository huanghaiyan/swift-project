//
//  MAWebViewController.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/19.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit
import WebKit

class MAWebViewController: BaseViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "网页"
        
        view.addSubview(webView)
        
        let htmlPathUrl = Bundle.main.url(forResource: "js-origin", withExtension: "html")
        let request = URLRequest(url: htmlPathUrl!)
        webView.load(request)
    }
    
    //MARK:-WKScriptMessageHandler
    //WebView中给Swift发消息
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
    
    //MARK:-swift调用webView中的JS方法
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("sayHello('WebView你好！')") { (result, err) in
            print(result, err)
        }
    }
    
    
    //MARK:-lazy
    lazy var webView:WKWebView = {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.userContentController = WKUserContentController()
        configuration.userContentController.add(self, name: "sendMsg")
        
        let webView = WKWebView.init(frame: self.view.frame, configuration:configuration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.scrollView.bounces = true
        
        let url1 = URL.init(string: "http://www.baidu.com")
        webView.load(URLRequest.init(url: url1!))
        
        return webView
    }()
}
