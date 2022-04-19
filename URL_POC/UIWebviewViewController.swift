//
//  UIWebviewViewController.swift
//  URL_POC
//
//  Created by Edward Keselman on 19/04/2022.
//

import UIKit

class UIWebviewViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    
    private let url: URL;
    
    init(url: URL) {
        self.url = url
        print("url")
        print(url)
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load");
        view.backgroundColor = .systemBackground
        let webV    = UIWebView()
            webV.frame  = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            webV.loadRequest(NSURLRequest(url: url) as URLRequest)
            webV.delegate = self
            self.view.addSubview(webV)
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipeFunc(gesture: UISwipeGestureRecognizer) {
        print("swipeFunc");
        self.dismiss(animated: true, completion: nil)
    }
    

}
