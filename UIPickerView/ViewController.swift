//
//  ViewController.swift
//  UIPickerView
//
//  Created by Appcare Apple on 15/08/20.
//  Copyright © 2020 Appcare Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var pincode: UITextField!
    
    var picker = UIPickerView()
    
    var city = ["Hyderabad","chennai", "Bangalore"]
    var state = ["AP","TS","KA"]
    var country = ["India", "US", "China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.delegate = self
        pincode.delegate = self
        cityTF.delegate = self
        stateTF.delegate = self
        countryTF.delegate = self
        
        //let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        cityTF.inputView = picker
        stateTF.inputView = picker
        countryTF.inputView = picker
        
        //self.picker = picker
        
        //Getting Time zone
        let currentTimeZone = getCurrentTimeZone()
        print(currentTimeZone)
        
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        print(localTimeZoneAbbreviation)
        
    }
    
    
    func getCurrentTimeZone() -> String{
        return TimeZone.current.identifier
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.picker.reloadAllComponents()
    }
    
    //pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if cityTF.isFirstResponder {
            return city.count
        }else if stateTF.isFirstResponder {
            return state.count
        }else if countryTF.isFirstResponder {
            return country.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if cityTF.isFirstResponder {
            return city[row]
        }else if stateTF.isFirstResponder {
            return state[row]
        }else if countryTF.isFirstResponder {
            return country[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if cityTF.isFirstResponder {
            cityTF.text = city[row]
        }else if stateTF.isFirstResponder {
            stateTF.text = state[row]
        }else if countryTF.isFirstResponder {
            countryTF.text = country[row]
        }
    }
}

