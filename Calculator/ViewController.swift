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

    var isUserInTheMiddleOfTypingANumber: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        if (isUserInTheMiddleOfTypingANumber) {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isUserInTheMiddleOfTypingANumber = true
        }
    }
}

