//
//  ImageHelper.swift
//  Greenseer
//
//  Created by Elizer Dela Cruz on 6/22/14.
//  Copyright (c) 2014 Eli Dela Cruz. All rights reserved.
//

import Foundation

protocol ImageHelperProtocol {
//    func
}

class ImageHelper: NSObject {

    let baseAddress : NSString =  "https://ajax.googleapis.com/ajax/services/search/images"
    let imageEndpointFormat : NSString =  "?v=1.0&q=%@"
    
    init() {}
    
//    func initWithDelegate(delegate : id)  {
//        
//    }
    
    func getImage(query : NSString) {
        
    }
    
}
