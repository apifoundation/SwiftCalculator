//
//  ViewController.swift
//  Calculator
//
//  Created by Emmanuel Mayorga on 12/8/19.
//  Copyright © 2019 Emmanuel Mayorga. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var doingMath = false
    var operation = ""
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: roundButton) {
        let receivedNumber = sender.currentTitle!
        
        if doingMath {
            label.text = receivedNumber
            numberOnScreen = Double(receivedNumber)!
            doingMath = false
        } else {
            label.text = label.text! + receivedNumber
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func operators(_ sender: roundButton) {
        let receivedOperator = sender.currentTitle!
        
        if isMathOperator(receivedOperator: receivedOperator) {
            previousNumber = Double(label.text!)!
            label.text = receivedOperator
            operation = receivedOperator
            doingMath = true
        } else if receivedOperator == "=" {
            switch operation {
                case "/":
                    label.text = formattedByDecimal(result: previousNumber / numberOnScreen)
                case "x":
                    label.text = formattedByDecimal(result: previousNumber * numberOnScreen)
                case "+":
                    label.text = formattedByDecimal(result: previousNumber + numberOnScreen)
                case "-":
                    label.text = formattedByDecimal(result: previousNumber - numberOnScreen)
                default:
                    break
            }
        } else if receivedOperator == "C" {
            label.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = ""
            doingMath = false
        }
    }
    
    func formattedByDecimal(result: Double) -> String {
        if floor(result) == result {
            return String(Int(result))
        }
        return String(result)
    }

    func isMathOperator(receivedOperator: String) -> Bool {
        return label.text != "" && receivedOperator != "C" && receivedOperator != "="
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override open var shouldAutorotate: Bool {
        return false
    }
        
    @IBOutlet var buttonCollection: [roundButton]!
    
}
