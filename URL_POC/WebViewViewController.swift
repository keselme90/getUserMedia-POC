//
//  WebViewViewController.swift
//  URL_POC
//
//  Created by Edward Keselman on 17/04/2022.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    private let webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript  = true;
        let configurtions = WKWebViewConfiguration();
        configurtions.defaultWebpagePreferences = preferences;
        configurtions.allowsInlineMediaPlayback = true;
        configurtions.requiresUserActionForMediaPlayback = false
        let webView = WKWebView(frame: .zero, configuration: configurtions)
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        return webView;
    }()
    
    private let url: URL;
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .systemBackground
        view.addSubview(webView);
        webView.load(URLRequest(url: url));
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipeFunc(gesture: UISwipeGestureRecognizer) {
        print("swipeFunc");
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    @available(iOS 15, *)
    func webView(
        _ webView: WKWebView,
        requestMediaCapturePermissionFor origin: WKSecurityOrigin,
        initiatedByFrame frame: WKFrameInfo,
        type: WKMediaCaptureType,
        decisionHandler: @escaping (WKPermissionDecision) -> Void
    ) {
        decisionHandler(.grant)
    }
}
