//
//  BaseRequest.swift
//  DRON
//
//  Created by oguzkilic on 31.07.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//

import Foundation


// all API requests should extend this file
class BaseRequest : NSObject, Serializable {
    
    // property names to be included in JSON
    var jsonProperties : [String]
    
    override init() {
        jsonProperties = []
    }
    
    // HTTP Method of the request - override if different than GET
    func METHOD() -> String {
        return "GET"
    }
    
    // Path of the request - must override
    func PATH() -> String {
        fatalError("must override")
    }
    
    // should show loading indicator - defaults to true
    func INDICATOR() -> Bool {
        return true
    }
    
    // Indicator message
    func hudMessage() -> String {
        return "Loading..."
    }
    
    // Indicator type
    /*func hudType() -> MBProgressHUDMode {
        return MBProgressHUDMode.Indeterminate
    }
    */
}
