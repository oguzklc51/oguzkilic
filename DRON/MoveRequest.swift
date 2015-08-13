//
//  MoveRequest.swift
//  DRON
//
//  Created by oguzkilic on 31.07.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//


class MoveRequest: BaseRequest {
    
    var direction : String = ""
    
    override init(){
        super.init()
        jsonProperties = ["direction"]
    }
    
    override func METHOD() -> String {
        return "POST"
    }
    
    override func PATH() -> String {
        return "/move"
    }
    
    
    override func INDICATOR() -> Bool {
        return false
    }


}
