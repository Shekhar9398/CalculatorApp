//
//  ViewController.swift
//  calcpro
//
//  Created by Shraddha Manwar on 22/06/22.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- @IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK:- Parameters
    var currentNumber = ""
    var leftValue = ""
    var rightValue = ""
    var currentOperation:Operations = .Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
    }
    
    // MARK:- @IBAction
    @IBAction func dotPressed(_ sender: RoundButton) {
        if !currentNumber.contains(".") {
            print("\(currentNumber)")
            currentNumber += "."
            resultLabel.text = currentNumber
        }
        
    }
    
    // MARK:-@for all numbers
    @IBAction func buttonPressed(_ sender: RoundButton) {
        currentNumber += "\(sender.tag)"
        resultLabel.text! = currentNumber
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        currentNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        resultLabel.text! = "0"
    }
    
    // MARK:- @IBActions
    @IBAction func deletePressed(_ sender: RoundButton) {
        if !currentNumber.isEmpty {
            currentNumber.removeLast()
            resultLabel.text = currentNumber
        }
    }
    
    func getLeftValue(operationType: Operations) {
        currentOperation = operationType
        if !currentNumber.isEmpty {
            leftValue = currentNumber
            currentNumber = ""
        }
    }
    
    @IBAction func minusPressed(_ sender: RoundButton) {
        getLeftValue(operationType: .Subtract)
    }
    
    @IBAction func plusPresses(_ sender: RoundButton) {
        getLeftValue(operationType: .Add)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        getLeftValue(operationType: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        getLeftValue(operationType: .Divide)
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        if currentOperation != .Empty && !currentNumber.isEmpty {
            rightValue = currentNumber
            currentNumber = ""
            
            switch currentOperation {
            case .Add:
                result = "\(Double(leftValue)! + Double(rightValue)!)"
              resultLabel.text = test(res: result)
                print("add")
                
            case .Subtract:
                result = "\(Double(leftValue)! - Double(rightValue)!)"
                resultLabel.text = test(res: result)
                print("sub")
                
            case .Divide:
                result = "\(Double(leftValue)! / Double(rightValue)!)"
                resultLabel.text = test(res: result)
                print("div")
                
            case .Multiply:
                result = "\(Double(leftValue)! * Double(rightValue)!)"
                resultLabel.text = test(res: result)
                print("mul")
            default:
                break
            }
        } else {
            print("current operation \(currentOperation) and current number is \(currentNumber)")
        }
    }
    
    func test(res: String) -> String {
        if (Double(res)?.truncatingRemainder(dividingBy: 1) == 0) {
            return "\(Int(Double(res)!))"
        }
        
        return "\(Double(res)!)"
    }
}

