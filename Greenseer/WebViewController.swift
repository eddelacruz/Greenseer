//
//  WebViewController.swift
//  Greenseer
//
//  Created by Elizer Dela Cruz on 6/22/14.
//  Copyright (c) 2014 Eli Dela Cruz. All rights reserved.
//

import UIKit
import Foundation

class WebViewController: UIViewController {
    var character : Character = Character();
    
//    @IBOutlet var webView   : UIWebView
    @IBOutlet var imageView : UIImageView = nil
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationController.navigationBar.translucent = false;
        
//        let request : NSURLRequest = NSURLRequest(URL: NSURL(string: self.character.link));
//        self.webView.loadRequest(request);
        println(self.character.imageLink);
        let imageURL : NSURL = NSURL(string: self.character.imageLink);
        self.imageView.setImageWithURL(imageURL);
        
        self.title = character.name;
    }
}
