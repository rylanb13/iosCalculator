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
    var function = ""
    var numArray: [Float] = []
    
    @IBAction func numberTapped(sender: UIButton) {
        let number = sender.currentTitle
        if isTypingNumber == true {
            calculatorDisplay.text = calculatorDisplay.text! + number!
        } else {
            calculatorDisplay.text = number
        }
        isTypingNumber = true
        
    }
    
    @IBAction func avgTapped(sender: UIButton) {
        isTypingNumber = false;
        function = sender.currentTitle!
        firstNumber = Float(calculatorDisplay.text!)!
        numArray += [firstNumber]
    }
    
    
    @IBAction func operationTapped(sender: UIButton) {
        isTypingNumber = false
        firstNumber = Float(calculatorDisplay.text!)!
        operation = sender.currentTitle!
    }
    
    @IBAction func dotTapped(sender: UIButton) {
        let dot = sender.currentTitle!
        calculatorDisplay.text = calculatorDisplay.text! + dot
        
    }
    
    @IBAction func equalsTapped(sender: UIButton) {
        secondNumber = Float(calculatorDisplay.text!)!
        if function == "Avg" {
            var sum: Float = 0.0;
            for numbers in numArray {
                sum = sum + numbers;
            }
            sum = sum + secondNumber;
            result = sum / Float(numArray.count + 1);
        } else if function == "Count" {
            result = Float(numArray.count + 1)
        } else if operation == "+" {
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
    
    @IBAction func clearTapped(sender: UIButton) {
        isTypingNumber = false
        firstNumber = 0
        secondNumber = 0
        result = 0
        function = ""
        numArray = []
        calculatorDisplay.text = "\(result)"
    }
    
    @IBAction func factTapped(sender: UIButton) {
        isTypingNumber = false;
        firstNumber = Float(calculatorDisplay.text!)!
        var sum = 1;
        if firstNumber > 0 {
            for (var index = 1; index <= Int(round(firstNumber)); index++) {
                sum *= index;
            }
        }
        calculatorDisplay.text = "\(sum)";
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

