//
//  ViewController.swift
//  Greenseer
//
//  Created by Elizer Dela Cruz on 6/22/14.
//  Copyright (c) 2014 Eli Dela Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSURLConnectionDataDelegate {
    
    @IBOutlet var tableView : UITableView
    var characters : NSArray = []
    var selectedCharacter : Character = Character();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate      = self;
        tableView.dataSource    = self;
        self.getCharacters();
    }
    
    func getCharacters() {
        let url         : NSURL = NSURL(string: "http://gameofthrones.wikia.com/api/v1/Articles/top?category=characters");
        let request     : NSURLRequest = NSURLRequest(URL: url);
        let connection  : NSURLConnection = NSURLConnection.connectionWithRequest(request, delegate: self);
    }
    
    func getImage(character:Character, query: NSString) {
        let url         : NSURL = NSURL(string: "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=\(query)&imgsz=large");
        let request     : NSURLRequest = NSURLRequest(URL: url);
        let queue   : NSOperationQueue = NSOperationQueue();
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response:NSURLResponse!, responseData:NSData!, error: NSError!) -> Void in
            
            let json : NSDictionary = self.parseJSON(responseData);
            let responseData : NSDictionary = json.objectForKey("responseData") as NSDictionary;
            let results : NSArray = responseData.objectForKey("results") as NSArray;
            let firstImage : NSDictionary = results.firstObject as NSDictionary;
            let firstImageUrl : NSString = firstImage.objectForKey("tbUrl") as NSString;
            character.imageLink = firstImageUrl;
            })
    }
    
    func parseJSON(inputData: NSData) -> NSDictionary {
        var error : NSError?
        var boardsDictionary : NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        return boardsDictionary
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let c = self.characters.objectAtIndex(indexPath.row) as Character;
        self.selectedCharacter = c;
        self.performSegueWithIdentifier("DetailSegue", sender: nil);
    }
    
    // table view
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return characters.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
       
        var item : Character = characters.objectAtIndex(indexPath.row) as Character;
        
        var cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell;
        
        cell.textLabel.text = item.name;

        let query : NSString = item.name.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding);
        self.getImage(item, query:query);
        
        return cell;
    }
    
    // url connection
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        let host = connection.currentRequest.URL.host;
        
        if (host == "gameofthrones.wikia.com") {
            let json : NSDictionary = parseJSON(data);
            characters = json.objectForKey("items") as NSArray;
            characters = Character().convert(characters);
            self.tableView.reloadData();
        } else {
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "DetailSegue") {
            let wvc : WebViewController = segue.destinationViewController as WebViewController;
            wvc.character = self.selectedCharacter;
        }
    }
}

