//
//  WebViewController.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 28/09/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.loadHTMLString("hello", baseURL: nil)
        webview.navigationDelegate = self
    }

}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.request.url != nil {
            print(navigationAction.request.url)
        } else {
            print("dummy")
        }
    }
}
