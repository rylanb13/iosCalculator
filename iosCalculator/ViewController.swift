//
//  ViewController.swift
//  iosCalculator
//
//  Created by Rylan Bonnevie on 10/26/15.
//  Copyright © 2015 Rylan Bonnevie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    var isTypingNumber = false
    var firstNumber: Float = 0
    var secondNumber: Float = 0
    var result: Float = 0
    var operation = ""
    
    @IBAction func numberTapped(sender: AnyObject) {
        let number = sender.currentTitle
        if isTypingNumber == true {
            calculatorDisplay.text = calculatorDisplay.text! + number!!
        } else {
            calculatorDisplay.text = number
        }
        isTypingNumber = true
    }
    
    @IBAction func operationTapped(sender: AnyObject) {
        isTypingNumber = false
        firstNumber = Float(calculatorDisplay.text!)!
        operation = sender.currentTitle!!
    }
    
    @IBAction func dotTapped(sender: AnyObject) {
        let dot = sender.currentTitle!
        calculatorDisplay.text = calculatorDisplay.text! + dot!
        
    }
    
    @IBAction func equalsTapped(sender: AnyObject) {
        secondNumber = Float(calculatorDisplay.text!)!
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        } else if operation == "X" {
            result = firstNumber * secondNumber
        } else {
            result = firstNumber / secondNumber
        }
        calculatorDisplay.text = "\(result)"
    }
    
    @IBAction func clearTapped(sender: AnyObject) {
        isTypingNumber = false
        firstNumber = 0
        secondNumber = 0
        result = 0
        calculatorDisplay.text = "\(result)"
    }
    
    @IBAction func functionTapped(sender: AnyObject) {
        isTypingNumber = false;
        firstNumber = Float(calculatorDisplay.text!)!
        operation = sender.currentTitle!!
        if operation == "!" {
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

