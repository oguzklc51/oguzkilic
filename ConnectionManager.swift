//
//  ConnectionManager.swift
//  DRON
//
//  Created by oguzkilic on 31.07.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//


import Foundation


// helper class to make API requests
class ConnectionManager {
    
    // here we define base server url
    let baseURL = "http://78.46.106.130/"
    let timeout = 60.0
    
    class var Instance : ConnectionManager {
        struct Static {
            static let instance : ConnectionManager = ConnectionManager()
        }
        return Static.instance
    }

    func makeRequest(request: BaseRequest,
        callback: (response : NSDictionary, error : String) -> Void) {
            
           
            
            if !request.INDICATOR() {
               
            }
            
            NSURLCache.sharedURLCache().removeAllCachedResponses()
            
            let url = NSURL(string: baseURL + request.PATH())!
            var urlRequest = NSMutableURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: timeout)
            urlRequest.HTTPMethod = request.METHOD()
            urlRequest.addValue("max-age=0, no-cache, no-store", forHTTPHeaderField: "Cache-Control")
            
            let tempArray = NSMutableArray()
            Serialize.toDictionary(request).enumerateKeysAndObjectsUsingBlock { (key, obj, stop) -> Void in
                if(request.METHOD() == "POST") {
                    tempArray.addObject("\(key)=\(obj!)")
                } else {
                    tempArray.addObject("\(key)=\(obj.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!)")
                }
            }
            
           
            tempArray.addObject("rnd\(arc4random_uniform(1234567))=\(arc4random_uniform(1234567))")
            
            var getParams = tempArray.componentsJoinedByString("&")
            if(request.METHOD() == "GET") {
                urlRequest.URL = NSURL(string: baseURL + request.PATH() + "?" + getParams)
            } else {
                urlRequest.HTTPBody = getParams.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            }
            
            println("API request to \(urlRequest.URL) with params \(tempArray)")
            
            NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response : NSURLResponse!,data : NSData!, error : NSError!) -> Void in
                
                
                if (error != nil) {
                    println("API error: \(error), \(error.userInfo)")
                    callback(response: NSDictionary(),error: error.localizedDescription)
                    return
                }
                
                var jsonError : NSError?
                
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &jsonError) as? NSDictionary {
                    if (jsonError != nil) {
                        
                        callback(response: NSDictionary(),error: jsonError!.localizedDescription)
                    } else {
                        
                        callback(response: json,error: "")
                    }
                } else {
                   println("Invalid server response : \(request)")
                    callback(response: NSDictionary(),error: "Invalid server response")
                }
            }
    }
}