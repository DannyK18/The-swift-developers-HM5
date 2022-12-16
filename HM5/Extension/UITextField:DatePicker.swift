//
//  UITextField:DatePicker.swift
//  HM5
//
//  Created by Daniel on 03.12.2022.
//

import Foundation
import UIKit

extension UITextField {
    func datePicker<T>(target: T, doneAction: Selector, cancelAction: Selector, datePickerMode: UIDatePicker.Mode = .date) {
        
        let screenWidth = UIScreen.main.bounds.width
        
        func butttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            
            let buttonTarget = style == .flexibleSpace ? nil : target
            
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style, target: buttonTarget, action: action)
            
            return barButtonItem
        }
        
        let datepicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        
        datepicker.datePickerMode = datePickerMode
        datepicker.preferredDatePickerStyle = .wheels
        self.inputView = datepicker
       
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        
        toolBar.setItems([butttonItem(withSystemItemStyle: .cancel),
                          butttonItem(withSystemItemStyle: .flexibleSpace),
                          butttonItem(withSystemItemStyle: .done)
                         ],animated: true)
        
        self.inputAccessoryView = toolBar
    }
    
   
    func PickerView<T>(target: T, doneAction: Selector, cancelAction: Selector) {
        
        let screenWidth = UIScreen.main.bounds.width
        
        func butttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            
            let buttonTarget = style == .flexibleSpace ? nil : target
            
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style, target: buttonTarget, action: action)
            
            return barButtonItem
        }
        
        let picker = UIPickerView()
        
        self.inputView = picker
       
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        
        toolBar.setItems([butttonItem(withSystemItemStyle: .cancel),
                          butttonItem(withSystemItemStyle: .flexibleSpace),
                          butttonItem(withSystemItemStyle: .done)
                         ],animated: true)
        
        self.inputAccessoryView = toolBar
    }
}
