//
//  WebViewController.swift
//  Greenseer
//
//  Created by Elizer Dela Cruz on 6/22/14.
//  Copyright (c) 2014 Eli Dela Cruz. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var character : Character = Character();
    
    @IBOutlet var webView : UIWebView

    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationController.navigationBar.translucent = false;
        
        println(self.character.id);
        
        let request : NSURLRequest = NSURLRequest(URL: NSURL(string: self.character.link));
        self.webView.loadRequest(request);
        
        self.title = character.name;
    }
}
