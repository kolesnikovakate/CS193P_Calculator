//
//  ViewController.swift
//  Calculator
//
//  Created by Екатерина Колесникова on 16.02.15.
//  Copyright (c) 2015 kkate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var historyDisplay: UILabel!

    var isUserInTheMiddleOfTypingANumber = false
    var brain = CalculatorBrain()

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        if (isUserInTheMiddleOfTypingANumber) {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isUserInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func operate(sender: UIButton) {
        if (isUserInTheMiddleOfTypingANumber) {
            enter()
        }
        if let operation = sender.currentTitle {
            historyDisplay.text = historyDisplay.text! + operation + " "
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }

    @IBAction func enter() {
        isUserInTheMiddleOfTypingANumber = false
        historyDisplay.text = historyDisplay.text! + "\(displayValue) "
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }

    @IBAction func clearAll() {
        displayValue = 0
        historyDisplay.text = ""
        isUserInTheMiddleOfTypingANumber = false
        brain.clear()
    }

    @IBAction func enterADecimalPoint() {
        if (isUserInTheMiddleOfTypingANumber && display.text!.rangeOfString(".") == nil) {
            display.text = display.text! + "."
        } else if (!isUserInTheMiddleOfTypingANumber ) {
            display.text = "0."
            isUserInTheMiddleOfTypingANumber = true
        }
    }

    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

