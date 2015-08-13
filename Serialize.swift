//
//  Serializable.swift
//  DRON
//
//  Created by oguzkilic on 31.07.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//


import Foundation

/*
Purpose:
Convert (or Serialize) an object to a JSON String or Dictionary.

Usage:
Use 'Serialize.toJSON' on instances of classes that:
- Inherit from NSObject
- Implement 'Serializable' protocol
- Implement the property 'jsonProperties' and return an array of strings with names of all the properties to be serialized

Inspiration/Alternative:
https://gist.github.com/turowicz/e7746a9c035356f9483d

*/

import Foundation

@objc protocol Serializable {
    
    var jsonProperties : Array<String> { get }
    
    func valueForKey(key: String!) -> AnyObject!
}

struct Serialize {
    
    static func toDictionary(obj:Serializable) -> NSDictionary {
        // make dictionary
        var dict = Dictionary<String, AnyObject>()
        
        // add values
        for prop in obj.jsonProperties {
            
            var val : AnyObject! = obj.valueForKey(prop)
            
            if (val is String)
            {
                dict[prop] = val as! String
            }
            else if (val is Double)
            {
                dict[prop] = val as! Double
            }
            else if (val is Int)
            {
                dict[prop] = val as! Int
            }
            else if (val is Array<String>)
            {
                dict[prop] = val as! Array<String>
            }
            else if (val is Array<Int>)
            {
                dict[prop] = val as! Array<Int>
            }
            else if (val is Array<Double>)
            {
                dict[prop] = val as! Array<Double>
            }
            else if (val is Serializable)
            {
                dict[prop] = toJSON(val as! Serializable)
            }
            else if (val is Array<Serializable>)
            {
                var arr = Array<NSDictionary>()
                
                for item in (val as! Array<Serializable>) {
                    arr.append(toDictionary(item))
                }
                
                dict[prop] = arr
            }
        }
        
        // return dict
        return dict
    }
    
    static func toJSON(obj:Serializable) -> String {
        // get dict
        var dict = toDictionary(obj)
        
        // make JSON
        var error:NSError?
        var data = NSJSONSerialization.dataWithJSONObject(dict, options:NSJSONWritingOptions(0), error: &error)
        
        // return result
        return NSString(data: data!, encoding: NSUTF8StringEncoding) as String!
    }
}

