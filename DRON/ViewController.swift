//
//  ViewController.swift
//  DRON
//
//  Created by oguzkilic on 30.07.2015.
//  Copyright (c) 2015 oguzkilic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var moveRequest : MoveRequest  = MoveRequest()
    
    @IBAction func right(sender: UIButton) {
        
        self.moveDron("RIGHT")
    }
    @IBAction func left(sender: UIButton) {
    }
    @IBAction func down(sender: UIButton) {
    }
    @IBAction func up(sender: UIButton) {
    }
    @IBAction func `break`(sender: UIButton) {
    }
    @IBAction func run(sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveDron(direction: String) -> Void {
        moveRequest.direction = direction
        ConnectionManager.Instance.makeRequest(moveRequest, callback: { (response, error) -> Void in
            println("response \(response)")
        })
        
    }
    
    
    
}

