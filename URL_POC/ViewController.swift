//
//  ViewController.swift
//  URL_POC
//
//  Created by Edward Keselman on 13/04/2022.
//

import UIKit
import SafariServices
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        urlTextField.returnKeyType = UIReturnKeyType.done;
        urlTextField.delegate = self
        urlTextField.text = "https://webrtc.github.io/samples/src/content/getusermedia/gum/";
        
        requestCameraPermission();
        requestMicrophonePermission();
        // Do any additional setup after loading the view.
    }
    
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
            guard accessGranted == true else { return }
        })
    }
    
    func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission({ granted in
            // Handle granted
        })
    }

    @IBAction func safariBrowser(_ sender: Any) {
        if let url = URL(string: urlTextField.text ?? "https://www.google.com") {
            if (!urlTextField.isHidden) {
                urlTextField.endEditing(true)
            }
            print(url)
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func sfSafariView(_ sender: Any) {
        if let url = URL(string: urlTextField.text ?? "https://www.google.com") {
            if (!urlTextField.isHidden) {
                urlTextField.endEditing(true)
            }
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
    }
    
    @IBAction func wkWebView(_ sender: Any) {
        if let url = URL(string: urlTextField.text ?? "https://www.google.com") {
            if (!urlTextField.isHidden) {
                urlTextField.endEditing(true)
            }
            let vc = WebViewViewController(url: url)
            vc.modalPresentationStyle = .fullScreen
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen;
            present(navVC, animated:true)
            
            // Navigation using Storyboard setup
//            let vc = WKWebViewViewController(url: url)
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated:true, completion: nil)
            }
    }
    
    @IBAction func openWithUIWebView(_ sender: Any) {
        if let url = URL(string: urlTextField.text ?? "https://www.google.com") {
            if (!urlTextField.isHidden) {
                urlTextField.endEditing(true)
            }
        // Navigation using Storyboard setup
            let vc = UIWebviewViewController(url: url)
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated:true, completion: nil)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

