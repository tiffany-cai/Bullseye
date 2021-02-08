//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Tiffany Cai on 2/24/20.
//  Copyright © 2020 Tiffany Cai. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
        //If you had said dismiss(animated: false, ...), then there would be no page flip and the main screen would instantly reappear. From a user experience perspective, it’s often better to show transitions from one screen to another via an animation.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "Bullseye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
