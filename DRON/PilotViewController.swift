//
//  PilotViewController.swift
//  DRON
//
//  Created by oguzkilic on 14.08.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//

import SpriteKit
import UIKit



class PilotViewController: UIViewController {
    
    var imageBackground : UIImageView = UIImageView()
    var takeOffButton : UIButton = UIButton()
    var rescueButton : UIButton = UIButton()
    var emergencyButton : UIButton = UIButton()
    var bottomBar : UIToolbar = UIToolbar()
    var recordButton : UIButton = UIButton()
    var photoButton : UIButton = UIButton()
    var recycleButton : UIButton = UIButton()
    var upButton : UIButton = UIButton()
    var downButton : UIButton = UIButton()
    var leftButton : UIButton = UIButton()
    var rightButton : UIButton = UIButton()
    var uppButton : UIButton = UIButton()
    var downnButton : UIButton = UIButton()
    var lefttButton : UIButton = UIButton()
    var righttButton : UIButton = UIButton()
    
    var label : UILabel = UILabel()
    var timerr : NSTimer = NSTimer()
    var counter = 0
    
    var flag = true
    var flagg = true
    var isStop = false;
    
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
        
        recordButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 230, y: 1, width: 30,height: 30)
        //recordButton.layer.borderWidth = 1.0
        //recordButton.layer.borderColor = UIColor.whiteColor().CGColor
        recordButton.setImage(UIImage(named: "record"), forState: UIControlState.Normal)
        recordButton.addTarget(self, action:Selector("recordButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController!.navigationBar.addSubview(recordButton)
        
        photoButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 280, y: 1, width: 30, height: 30)
        photoButton.setImage(UIImage(named: "camera"), forState: UIControlState.Normal)
        self.navigationController!.navigationBar.addSubview(photoButton)
        
        recycleButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 180, y: 2, width: 28, height: 28)
        recycleButton.setImage(UIImage(named: "recycle"), forState: UIControlState.Normal)
        recycleButton.addTarget(self, action:Selector("recycleButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController!.navigationBar.addSubview(recycleButton)
        
        upButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 250, y: UIScreen.mainScreen().bounds.size.height - 150, width: 30, height: 30)
        upButton.setImage(UIImage(named: "up"), forState: UIControlState.Normal)
        upButton.addTarget(self, action:Selector("upButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(upButton)
        
        downButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 250, y: UIScreen.mainScreen().bounds.size.height - 90, width: 30, height: 30)
        downButton.setImage(UIImage(named: "down"), forState: UIControlState.Normal)
        downButton.addTarget(self, action:Selector("downButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(downButton)
        
        rightButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 280, y: UIScreen.mainScreen().bounds.size.height - 120, width: 30, height: 30)
        rightButton.setImage(UIImage(named: "right"), forState: UIControlState.Normal)
        rightButton.addTarget(self, action:Selector("rightButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(rightButton)
        
        leftButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 220, y: UIScreen.mainScreen().bounds.size.height - 120, width: 30, height: 30)
        leftButton.setImage(UIImage(named: "left"), forState: UIControlState.Normal)
        leftButton.addTarget(self, action:Selector("leftButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(leftButton)
        
        uppButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 - 280, y: UIScreen.mainScreen().bounds.size.height - 150, width: 30, height: 30)
        uppButton.setImage(UIImage(named: "up"), forState: UIControlState.Normal)
        uppButton.addTarget(self, action:Selector("uppButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(uppButton)
        
        downnButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 - 280, y: UIScreen.mainScreen().bounds.size.height - 90, width: 30, height: 30)
        downnButton.setImage(UIImage(named: "down"), forState: UIControlState.Normal)
        downnButton.addTarget(self, action:Selector("downnButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(downnButton)
        
        righttButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 - 310, y: UIScreen.mainScreen().bounds.size.height - 120, width: 30, height: 30)
        righttButton.setImage(UIImage(named: "left"), forState: UIControlState.Normal)
        righttButton.addTarget(self, action:Selector("righttButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(righttButton)
        
        lefttButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 - 250, y: UIScreen.mainScreen().bounds.size.height - 120, width: 30, height: 30)
        lefttButton.setImage(UIImage(named: "right"), forState: UIControlState.Normal)
        lefttButton.addTarget(self, action:Selector("lefttButtonAction:") , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(lefttButton)
        
        
        
        


        
    }
    
    func takeOffButtonAction (sender : UIButton) -> Void {
        
        if flag == true {
            
            takeOffButton.setTitle("FLYING", forState: UIControlState.Normal)
            takeOffButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            takeOffButton.layer.borderWidth = 1.0
            takeOffButton.layer.borderColor = UIColor.blueColor().CGColor
            flag = false
            
        }
        else {
            
            takeOffButton.setTitle("TAKE OFF", forState: UIControlState.Normal)
            takeOffButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            takeOffButton.layer.borderWidth = 1.0
            takeOffButton.layer.borderColor = UIColor.greenColor().CGColor
            flag = true

        }
        
    }
    
    func rescueButtonAction (sender : UIButton) -> Void {
       
        if flag == false {
            
            takeOffButton.setTitle("TAKE OFF", forState: UIControlState.Normal)
            takeOffButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            takeOffButton.layer.borderWidth = 1.0
            takeOffButton.layer.borderColor = UIColor.greenColor().CGColor
            
        }
       
    }
    
    func emergencyButtonAction (sender : UIButton) -> Void {
        
    }
    
    func recordButtonAction (sender : UIButton) -> Void  {
        if(!isStop){
            isStop = true
            counter = 0
            label.alpha = 1
            label.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width - 40, y: 40, width: 30, height: 30)
            label.layer.borderWidth = 1.0
            label.layer.borderColor = UIColor.whiteColor().CGColor
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.yellowColor()
            self.view.addSubview(label)
            label.text = String(counter)
            timerr = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("showTime"), userInfo: nil, repeats: true)
        }else{
            label.text = String(counter)
            isStop = false;
            timerr.invalidate();
            label.alpha = 0
        }
    
    }
    
    func showTime() -> Void{
        label.text = String(counter++)
        
    }
    func recorDButtonAction (sender : UIButton) -> Void {
    
        
        
    }



    func recycleButtonAction (sender : UIButton) -> Void {
        
        recycleButton.setImage(UIImage(named: "recycle2"), forState: UIControlState.Normal)
        var timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("recyclEButtonAction:"), userInfo: nil, repeats: false)

    }
    
    func recyclEButtonAction (sender : UIButton) -> Void {
        
        recycleButton.setImage(UIImage(named: "recycle"), forState: UIControlState.Normal)
        
    }
    
    func upButtonAction (sender : UIButton) -> Void {
        
    }

    func downButtonAction (sender : UIButton) -> Void {
        
    }
    
    func rightButtonAction (sender : UIButton) -> Void {
        
    }
    
    func leftButtonAction (sender : UIButton) -> Void {
        
    }
    
    func uppButtonAction (sender : UIButton) -> Void {
        
    }
    
    func downnButtonAction (sender : UIButton) -> Void {
        
    }
    
    func righttButtonAction (sender : UIButton) -> Void {
        
    }
    
    func lefttButtonAction (sender : UIButton) -> Void {
        
    }

}
