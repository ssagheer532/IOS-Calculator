//
//  ViewController.swift
//  calculator
//
//  Created by Ahad Sagheer on 12/22/16.
//  Copyright © 2016 Ahad Sagheer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var newMessage = false
    
    
    @IBAction func temp(_ sender: UIButton) {
        let digit = sender.currentTitle!
        // var newMessage = false
        
        let textCurrentlyInDisplay = display!.text!
        if (newMessage == true){
            display!.text = textCurrentlyInDisplay + digit
        }
        else {
            display!.text = digit
        }
        newMessage = true
    }
    
    @IBAction func operation(_ sender: UIButton) {
        let symbol = sender.currentTitle!
        
        if (symbol == "π"){
            display!.text = String(M_PI)
        }
        else if (symbol == "√"){
            display!.text = String(sqrt(Double(display!.text!)!))
        }
        newMessage = false
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

