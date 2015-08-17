//
//  ViewController.swift
//  DRON
//
//  Created by oguzkilic on 30.07.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var moveRequest : MoveRequest = MoveRequest()
    var bgImageView : UIImageView = UIImageView()
    var pilotButton : UIButton = UIButton()
    var photosButton : UIButton = UIButton()
    
    @IBAction func right(sender: UIButton) {
        
        self.moveDron("RIGHT")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height)
        bgImageView.image = UIImage(named:"background")
        self.view.addSubview(bgImageView)
        
        
        pilotButton.frame = CGRect(x: 0, y: UIScreen.mainScreen().bounds.size.height / 2, width: UIScreen.mainScreen().bounds.size.width / 2 - 10, height: UIScreen.mainScreen().bounds.size.height / 2)
        pilotButton.setTitle("PILOTING", forState: UIControlState.Normal)
        pilotButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        /*pilotButton.layer.borderWidth = 1.0
        pilotButton.layer.borderColor = UIColor.whiteColor().CGColor*/
        pilotButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        pilotButton.addTarget(self, action:Selector("pilotAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(pilotButton)
        
        photosButton.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width / 2 + 10, y: UIScreen.mainScreen().bounds.size.height / 2, width: UIScreen.mainScreen().bounds.size.width / 2 - 10, height:  UIScreen.mainScreen().bounds.size.height / 2)
        photosButton.setTitle("PHOTOS", forState: UIControlState.Normal)
        photosButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        /*photosButton.layer.borderWidth = 1.0
        photosButton.layer.borderColor = UIColor.whiteColor().CGColor*/
        photosButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        photosButton.addTarget(self, action:Selector("photosAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(photosButton)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        pilotButton.backgroundColor = UIColor.clearColor()
        photosButton.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    func pilotAction(sender : UIButton) -> Void{
        pilotButton.backgroundColor = UIColor.orangeColor()
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("PilotViewController") as! PilotViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        
        println("button tapped")
    }
    
    func photosAction(sender : UIButton) -> Void{
        photosButton.backgroundColor = UIColor.orangeColor()
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("PhotosViewController") as! PhotosViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        println("button tapped")
    }

    
    func moveDron(direction: String) -> Void {
        moveRequest.direction = direction
        ConnectionManager.Instance.makeRequest(moveRequest, callback: { (response, error) -> Void in
            println("response \(response)")
        })
        
    }
    
    
    
}

