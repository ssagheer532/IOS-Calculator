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
    var afterDecimal = false
    @IBAction func temp(_ sender: UIButton) {
        if end == true && newComputation == true{
            display2!.text = ""
            display!.text = ""
            end = false
        }
        newComputation = false
        
        let digit = sender.currentTitle!
        // var newMessage = false
        
        let textCurrentlyInDisplay = display!.text!
        if (newMessage == true){
            display!.text = textCurrentlyInDisplay + digit
        }
        else {
            display!.text = digit
        }
        
        if afterDecimal == true {
            display2!.text = display2!.text! + sender.currentTitle! + " "
            afterDecimal = false
        }
        else if sender.currentTitle! == "." {
           display2!.text?.remove(at: (display2!.text!.index(before: display2!.text!.endIndex) ))//removes extra space
            display2!.text = display2!.text! + sender.currentTitle!

            newMessage = true
            afterDecimal = true
        }
            
        else if middleOfTyping == true {
            display2!.text?.remove(at: (display2!.text!.index(before: display2!.text!.endIndex) ))//removes extra space
            display2!.text = display2!.text! + sender.currentTitle! +  " "
            newMessage = true
        }
        else {
            
            display2!.text = display2!.text! + " " + display!.text! +  " "
            newMessage = true
        }
        middleOfTyping = true
        
    }
    var newComputation = true
    var middleOfTyping = false
    private var brain = CalculatorBrain()
    @IBAction func operation(_ sender: UIButton) {
        newComputation = false

        middleOfTyping = false
        if (newMessage == true){
            brain.setOperand(operand: Double(display!.text!)!)
            newMessage = false
        }
        if let mathSymbol = sender.currentTitle {
            brain.performeOperation(symbol: mathSymbol)
        }
        display!.text = String(brain.result)//this may cause issues
        if (sender.currentTitle! == "="){
            display2!.text = display!.text! + " "
            end = true
            newComputation = true
        }
        else{
            if sender.currentTitle! == "±"{
                var temp = display2!.text?.components(separatedBy: " ")
                //print(temp?[(temp?.count)! - 2])
                //print(display2!.text)
                temp?[(temp?.count)! - 2] = "-" + (temp?[(temp?.count)! - 2])!
               // print(temp?[(temp?.count)! - 2])
                display2!.text = temp?.joined(separator: " ")
            }
            else{
            display2!.text = display2!.text!  + sender.currentTitle!
            }
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

