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
    var deccimalEntered = false
    var end = false
    var afterDecimal = false
    @IBAction func temp(_ sender: UIButton) {
        
        if deccimalEntered == true && sender.currentTitle == "."{
            return
        }
        
        if end == true && newComputation == true {
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
            
            
        deccimalEntered = true
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
        
        deccimalEntered = false

       if end == true && (sender.currentTitle! == "e" || sender.currentTitle! == "π") {//fixes display bug
           display2!.text = ""
            display!.text = ""
            end = false
       }
        newComputation = false

        middleOfTyping = false
        if (newMessage == true){
            brain.setOperand(operand: Double(display!.text!)!)
            newMessage = false
        }
        if let mathSymbol = sender.currentTitle {
            brain.performeOperation(symbol: mathSymbol)
        }
        display!.text = String(brain.result) //this may cause issues
        if (sender.currentTitle! == "="){
            display2!.text = display!.text! + " "
            end = true
            newComputation = true
        }
            
        else{
            if sender.currentTitle! == "±"{//adds support for neg numbers
                var temp = display2!.text?.components(separatedBy: " ")
                //print(temp?[(temp?.count)! - 2])
                //print(display2!.text)
                temp?[(temp?.count)! - 2] = "-" + (temp?[(temp?.count)! - 2])!
               // print(temp?[(temp?.count)! - 2])
                display2!.text = temp?.joined(separator: " ")
            }
            else if sender.currentTitle! == "√" {//adds support for square root
                var temp = display2!.text?.components(separatedBy: " ")//temp is the array with each space seperated word in each index
                temp?[(temp?.count)! - 2] = display.text!
                // print(temp?[(temp?.count)! - 2])
                display2!.text = temp?.joined(separator: " ")
                
            }
            else if sender.currentTitle! == "e" || sender.currentTitle! == "π" {
                display2!.text = display2!.text!  + " " + sender.currentTitle! + " "
                end = false
                
            }
            else{
            display2!.text = display2!.text!  + sender.currentTitle!
                end = false
            }
        }
        if display!.text == "nan" || display!.text == "inf"{
            end = true
            newComputation = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equalsButton.layer.cornerRadius = 12
        plus_minusButton.layer.cornerRadius = 12
        button1.layer.cornerRadius = 12
        button2.layer.cornerRadius = 12
        button3.layer.cornerRadius = 12
        button4.layer.cornerRadius = 12
        button5.layer.cornerRadius = 12
        button6.layer.cornerRadius = 12
        button7.layer.cornerRadius = 12
        button8.layer.cornerRadius = 12
        button9.layer.cornerRadius = 12
        button0.layer.cornerRadius = 12
        
        buttonMultiply.layer.cornerRadius = 12
        buttonDivide.layer.cornerRadius = 12
        buttonSubtract.layer.cornerRadius = 12
        buttonAdd.layer.cornerRadius = 12
        buttonDecimal.layer.cornerRadius = 12
        buttonE.layer.cornerRadius = 12
        buttonPi.layer.cornerRadius = 12
        buttonSqr.layer.cornerRadius = 12

        self.navigationController?.isNavigationBarHidden = true

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var plus_minusButton: UIButton!
    
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonSubtract: UIButton!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonPi: UIButton!
    @IBOutlet weak var buttonSqr: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

