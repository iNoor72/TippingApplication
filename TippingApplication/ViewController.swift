//
//  ViewController.swift
//  TippingApplication
//
//  Created by Noor Walid on 7/26/20.
//  Copyright © 2020 Noor Walid. All rights reserved.
//

import UIKit

class CalculationVC: UIViewController {
    
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var thirtyButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var myStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var resultVC = ResultVC()
    var tipPerc = 0.0
    var val = 0.0
  
    
    @IBAction func tipChosen(_ sender: UIButton) {
        
        switch sender.restorationIdentifier {
            
        case "ten":
            tenButton.backgroundColor = UIColor.blue
            twentyButton.backgroundColor = UIColor.init(red: 114, green: 106, blue: 149, alpha: 1)
            thirtyButton.backgroundColor = UIColor.init(red: 114, green: 106, blue: 149, alpha: 1)
            tipPerc = 0.1
        case "twenty":
            twentyButton.backgroundColor = UIColor.blue
            tenButton.backgroundColor = UIColor.init(red: 114, green: 106, blue: 149, alpha: 1)
            thirtyButton.backgroundColor = UIColor.init(red: 114, green: 106, blue: 149, alpha: 1)
            tipPerc = 0.25
        default:
            thirtyButton.backgroundColor = .blue
            tenButton.backgroundColor = UIColor.init(red: 114, green: 106, blue: 149, alpha: 1)
            twentyButton.backgroundColor = UIColor.init(red: 114, green: 106, blue: 149, alpha: 1)
            tipPerc = 0.35
        }
        
        
    }
    
    @IBAction func changingPersons(_ sender: UIStepper) {
        numberOfPeople.text = String (format: "%0.0f", sender.value)
    }
    
    
    //Send to Calc file
    @IBAction func calculate(_ sender: UIButton) {
        if billAmount.text != nil {
            val = Calc (billAmount.text?.toDouble()! ?? 0.0, tipPerc, myStepper.value )
        }
//        val = Calc((billAmount.text as NSString).doublevalue, tipPerc, myStepper.value)
        performSegue(withIdentifier: "ResultVCSegue", sender: self)
    }
    
    //prepareForSegue here to pass all info (amount, tip, people)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultVCSegue" {
            let destVC = segue.destination as! ResultVC
            destVC.amount = val
            destVC.people = myStepper.value
            destVC.tipPerc = tipPerc
            
        }
    }

    //Send to Calc file
    func Calc (_ amount: Double, _ tip: Double, _ persons: Double) -> Double{
        
        //Var because when we recalc we need to set it again
        var result = (amount + (amount*tip) ) / persons
        print (result)
        return result
    }
    
}

extension String {
func toDouble() -> Double? {
    return NumberFormatter().number(from: self)?.doubleValue
 }
}

