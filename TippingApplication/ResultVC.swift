//
//  ResultVC.swift
//  TippingApplication
//
//  Created by Noor Walid on 7/26/20.
//  Copyright © 2020 Noor Walid. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var choosesText: UILabel!
    
    var amount : Double = 0.0
    var people : Double = 0.0
    var tipPerc : Double = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPerc *= 100
        resultText.text = String (format: "%.2f", amount)
        let peopleString = String (format: "%.0f", people), tipString = String(format: "%.0f", tipPerc)
        choosesText.text = "For \(peopleString) persons and a tip equal to \(tipString)%"
    }
    
    
    @IBAction func recalcualte(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
