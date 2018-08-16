//
//  SettingViewController.swift
//  Tip Calculator App
//
//  Created by Pat Khai on 7/22/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var bgLabel: UILabel!
    @IBOutlet weak var redTag: UILabel!
    @IBOutlet weak var defaultTag: UILabel!
    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTip.selectedSegmentIndex = MainSetting.getTipIndex()
        applyTheme()
        
   
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func changeTip(_ sender: Any) {
        MainSetting.setTipIndex(tipIndex: defaultTip.selectedSegmentIndex)
        
    }
    
    
    @IBAction func redSwitch(_ sender: UISwitch) {
        if sender.isOn {
             Theme.current = OrangeTheme()
        } else {
                Theme.current = WhiteTheme()
           
        }
        
     
        applyTheme()
  
    }
    

    
    
    func applyTheme() {
        view.backgroundColor = Theme.current.background
        bgLabel.textColor = Theme.current.text
        redTag.textColor = Theme.current.text
        defaultTag.textColor = Theme.current.text
        defaultTip.tintColor = Theme.current.tint
    }
    
    
            
            
        
        
        
        

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
