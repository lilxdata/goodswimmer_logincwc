//
//  Utilities.swift
//  goodswimmer_logincwc
//
//  Created by madi on 3/30/20.
//  Copyright © 2020 madi. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield: UITextField, size: Int) {
    // create bottom line detail
        let bottomLine = CALayer()
        let fontSize = CGFloat(size)
        bottomLine.frame = CGRect( x:0, y:textfield.frame.height + 5, width: textfield.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textfield.layer.addSublayer(bottomLine)
        textfield.textColor = UIColor.black
        textfield.font = UIFont(name: "Standard-Book", size: fontSize)
    }
    
    static func styleDisabledTextField(_ textfield: UITextField, size: Int) {
    // create bottom line detail
        let bottomLine = CALayer()
        let fontSize = CGFloat(size)
        bottomLine.frame = CGRect( x:0, y:textfield.frame.height + 5, width: textfield.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.systemGray2.cgColor
        textfield.layer.addSublayer(bottomLine)
        textfield.textColor = UIColor.black
        textfield.font = UIFont(name: "Standard-Book", size: fontSize)
    }
    
    
    static func styleHeader(_ label: UILabel){
        label.font = UIFont(name: "Career_salle13_cursive", size: 54)
        label.textColor = UIColor.black
        label.text = label.text?.uppercased()
    }
    
    static func styleSubHeader(_ label:UILabel) {
        label.font = UIFont(name: "CutiveMono-Regular", size: 21)
        label.textColor = UIColor.black
    }
    
    static func styleLabel(_ label: UILabel, size: Int, uppercase: Bool){
        let fontSize = CGFloat(size)
        label.font = UIFont(name: "Standard-Book", size: fontSize)
        if uppercase {
            label.text = label.text?.uppercased()
        }
    }
    
    static func styleButton(_ button: UIButton) {
        //rounded button
        button.titleLabel?.font = UIFont(name: "Standard-Book", size: 21)
       // button.layer.cornerRadius = 20.0
       // button.title = button.titleLabel?.text?.uppercased() // did not work
        button.setTitle(button.title(for: .normal)?.uppercased(), for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.bottom

    }
    
    static func styleError(_ label: UILabel) {
        styleSubHeader(label)
        label.textColor = UIColor.red
        label.numberOfLines = 0
    }
    
//    static func styleCheckbox(_ button: UIButton) {
//        button.tintColor = UIColor.black
//    }
//
//    static func styleBoxChecked(_ button: UIButton) {
//        button.tintColor = UIColor.black
//        button.backgroundColor = UIColor.red
//    }
    
    /* password validation */
    static func isPasswordValid(_ password: String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func cleanData(_ field: UITextField) -> String {
        return field.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    static func isFilledIn(_ fields: [UITextField]) -> Bool {
        for field in fields {
            if field == nil {
                print ("oops! you didn't fill everything in!")
                break
            } else {
                return true
            }
        }
        return false
    }
    
    
    // TODO: email validation
}
