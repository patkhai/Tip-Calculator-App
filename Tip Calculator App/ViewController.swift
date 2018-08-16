//
//  ViewController.swift
//  Tip Calculator App
//
//  Created by Pat Khai on 7/21/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPerc: UISegmentedControl!

    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var personText: UILabel!
    @IBOutlet weak var personTotal: UILabel!
    
    @IBOutlet weak var numPeople: UILabel!
    @IBOutlet weak var peopleBar: UISlider!

    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    
    @IBOutlet weak var peopleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipPerc.selectedSegmentIndex = MainSetting.getTipIndex()
        calculateTip(tipPerc)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let lastBill = MainSetting.getLastBill() {
            billField.text = lastBill
        }
        billField.becomeFirstResponder()
     
        
    
    }
    
    func applyTheme1(){
        view.backgroundColor = Theme.current.background
        billField.textColor = Theme.current.text
        peopleLabel.textColor = Theme.current.text
        billAmount.textColor = Theme.current.text
        tipLabel.textColor = Theme.current.text
        totalLabel.textColor = Theme.current.text
        personText.textColor = Theme.current.text
        personTotal.textColor = Theme.current.text
        numPeople.textColor = Theme.current.text
        totalText.textColor = Theme.current.text
        tipPerc.tintColor = Theme.current.tint
        tipText.textColor = Theme.current.text
        peopleBar.maximumTrackTintColor = Theme.current.tint
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = Theme.current.background
        applyTheme1()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func peopleSwitch(_ sender: Any) {
    
    peopleBar.value = roundf(peopleBar.value)
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
     
    }
    
    @IBAction func calculateTip(_ sender: Any) {
    
        //take in the string of user input and change it into the number else wrong input return <- (??) -> 0
        let tipPercentage = [0.085, 0.09, 0.1]
        let numOfPeople = Int(peopleBar.value)
        let billInput = Double(billField.text!) ?? 0
        MainSetting.setLastBill(lastBill: billField.text!)
        //make sure you value change and point it here the tipPercentage too!
        
        let tip = billInput * tipPercentage[tipPerc.selectedSegmentIndex]
        let total = billInput + tip
        let personTots = total/Double(numOfPeople)
        
        //here is the better option to do this
        numPeople.text = "No: \(numOfPeople)"
        tipText.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        personTotal.text = String(format: "$%.2f", personTots)
    }


    
    
}
    


