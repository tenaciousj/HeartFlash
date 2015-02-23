//
//  UserDataViewController.swift
//  Beta
//
//  Created by Jeanette Pranin on 2/21/15.
//  Copyright (c) 2015 Jeanette Pranin. All rights reserved.
//

import Foundation
import UIKit

class UserDataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var ageInt = 0
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func Cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 75
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(row + 15)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        ageInt = row+15
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ageUnwind"){
            let bio = BiometricInfo()
            bio.age = ageInt
            defaults.setInteger(ageInt, forKey: "age")
        }
    }
    
}