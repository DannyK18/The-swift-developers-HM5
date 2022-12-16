//
//  agePickerView.swift
//  HM5
//
//  Created by Daniel on 05.12.2022.
//

import UIKit

extension PopUpVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return 100
        } else if pickerView.tag == 1 {
            return genre.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return String(age[row])
        } else if pickerView.tag == 1 {
            return genre[row]
        }
       return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            ageTextField.text = String(age[row])
            ageTextField.resignFirstResponder()
        } else if pickerView.tag == 1 {
          genreTextField.text = genre[row]
          genreTextField.resignFirstResponder()
        }
    }  
}
