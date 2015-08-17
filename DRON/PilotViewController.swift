//
//  PilotViewController.swift
//  DRON
//
//  Created by oguzkilic on 14.08.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//

import UIKit



class PilotViewController: UIViewController {
    
    var imageBackground : UIImageView = UIImageView()
    var takeOffButton : UIButton = UIButton()
    var rescueButton : UIButton = UIButton()
    var emergencyButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        
        imageBackground.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height)
        imageBackground.image = UIImage(named: "PilotBackground")
        self.view.addSubview(imageBackground)
        
        takeOffButton.frame = CGRect (x: UIScreen.mainScreen().bounds.size.width / 2 + 5, y: UIScreen.mainScreen().bounds.size.height - 42, width: 100, height: 40)
        takeOffButton.layer.borderWidth = 1.0
        takeOffButton.layer.borderColor = UIColor.greenColor().CGColor
        takeOffButton.setTitle("TAKE OFF", forState: UIControlState.Normal)
        takeOffButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        takeOffButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        takeOffButton.addTarget(self, action:Selector("takeOffButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(takeOffButton)
        
        rescueButton.frame = CGRect (x: UIScreen.mainScreen().bounds.size.width / 2 - 105, y: UIScreen.mainScreen().bounds.size.height - 42, width: 100, height: 40)
        rescueButton.layer.borderWidth = 1.0
        rescueButton.layer.borderColor = UIColor.orangeColor().CGColor
        rescueButton.setTitle("RESCUE", forState: UIControlState.Normal)
        rescueButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        rescueButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        rescueButton.addTarget(self, action:Selector("rescueButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(rescueButton)
        
        emergencyButton.frame = CGRect (x: UIScreen.mainScreen().bounds.size.width / 2 - 50, y: 0, width: 100, height: 30)
        emergencyButton.layer.borderWidth = 1.0
        emergencyButton.layer.borderColor = UIColor.redColor().CGColor
        emergencyButton.setTitle("EMERGENCY", forState: UIControlState.Normal)
        emergencyButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        emergencyButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        emergencyButton.addTarget(self, action:Selector("emergencyButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController!.navigationBar.addSubview(emergencyButton)
        
    }
    
    func takeOffButtonAction (sender : UIButton) -> Void {
        
    }
    
    func rescueButtonAction (sender : UIButton) -> Void {
        
    }
    
    func emergencyButtonAction (sender : UIButton) -> Void {
        
    }

    
    
    

}
