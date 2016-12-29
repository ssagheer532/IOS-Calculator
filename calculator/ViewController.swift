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
    
    @IBOutlet weak var display2: UILabel!
    
    var end = false
    
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
        if end == true{
            display2!.text = ""
            end = false
        }
        display2!.text = display2!.text! + " " + display!.text! +  " "
        newMessage = true
    }
    private var brain = CalculatorBrain()
    @IBAction func operation(_ sender: UIButton) {
      /*  let symbol = sender.currentTitle!
        
        if (symbol == "π"){
            display!.text = String(M_PI)
        }
        else if (symbol == "√"){
            display!.text = String(sqrt(Double(display!.text!)!))
        }
        newMessage = false
 */
        
        display2!.text = display2!.text!  + sender.currentTitle!

        if (newMessage == true){
            brain.setOperand(operand: Double(display!.text!)!)
            newMessage = false
        }
        if let mathSymbol = sender.currentTitle {
            brain.performeOperation(symbol: mathSymbol)
        }
        display!.text = String(brain.result)
        if (sender.currentTitle! == "="){
            display2!.text = display!.text
            end = true
        }
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

