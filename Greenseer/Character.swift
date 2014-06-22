//
//  Character.swift
//  Greenseer
//
//  Created by Elizer Dela Cruz on 6/22/14.
//  Copyright (c) 2014 Eli Dela Cruz. All rights reserved.
//

import Foundation

class Character: NSObject {
    var id : NSInteger = 0
    var name : NSString = ""
    var link : NSString = ""
    let domain : NSString = "http://gameofthrones.wikia.com"
    
    class Converter {
        
        func convert(data: NSDictionary) -> Character {
            let c : Character = Character();
            c.id = data.objectForKey("id") as NSInteger;
            c.name = data.objectForKey("title") as NSString;
            let link = data.objectForKey("url") as NSString;
            c.link = "\(c.domain)\(link)";
            return c;
        }
    }
    
    func convert(list: NSArray) -> NSArray {
        var characters : NSMutableArray = NSMutableArray.array();
        
        for (idx, element : AnyObject) in enumerate(list) {
            let c : Character = Character.Converter().convert(element as NSDictionary);
            characters.addObject(c);
        }
        return characters;
    }

}

