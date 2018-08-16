//
//  MainSetting.swift
//  Tip Calculator App
//
//  Created by Pat Khai on 8/14/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class MainSetting {
    struct Variables {
        static let defaults = UserDefaults.standard
        static let defaultTip = "default_tip"
        static let lastBill = "last_bill"
        static let lastBillTotal = "last_total"
        static let lastTipValue = "last_tip"
        static let lastPerson = "last_person"
    }
    
    class func setTipIndex(tipIndex: Int) {
        Variables.defaults.set(tipIndex, forKey: Variables.defaultTip)
    }
    class func getTipIndex() -> Int {
        return Variables.defaults.integer(forKey: Variables.defaultTip)
    }
    
    class func setLastBill(lastBill: String) {
        Variables.defaults.set(lastBill, forKey: Variables.lastBill)
        Variables.defaults.synchronize()
    }

    class func getLastBill() -> String? {
        return Variables.defaults.string(forKey: Variables.lastBill)
    }
    
    class func setLastBillText(lastBillTotal: String) {
        Variables.defaults.set(lastBillTotal, forKey: Variables.lastBillTotal )
              Variables.defaults.synchronize()
    }
    
    class func getLastBillText() -> String? {
        return Variables.defaults.string(forKey: Variables.lastBillTotal)
    }
    
    class func setLastTipValue(lastTipValue: String) {
        Variables.defaults.set(lastTipValue, forKey: Variables.lastTipValue)
              Variables.defaults.synchronize()
    }
 
    
    
    
    
}
