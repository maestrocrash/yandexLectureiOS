//
//  WebScreenViewController.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 11.06.2023.
//

import UIKit
import WebKit

class WebScreenViewController: UIViewController, WKNavigationDelegate {

    lazy var webView: WKWebView = {
        let web = WKWebView()
        web.navigationDelegate = self
        web.translatesAutoresizingMaskIntoConstraints = false
        web.scrollView.isScrollEnabled = false
        web.allowsBackForwardNavigationGestures = true
        
        return web
    }()
    
    var urlYouTube: String?
    var titleNav: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let urlYouTube, let titleNav {
            navigationItem.title = titleNav
            let url = URL(string: urlYouTube)!
            webView.load(URLRequest(url: url))
        }
         
        view.backgroundColor = colorView
        view.addSubview(webView)
        
        setupConstraint()
    }

}


extension WebScreenViewController {
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
}
