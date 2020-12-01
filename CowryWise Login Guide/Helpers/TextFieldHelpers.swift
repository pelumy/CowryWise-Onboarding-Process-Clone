//
//  TextFieldHelpers.swift
//  CowryWise Login Guide
//
//  Created by mac on 29/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class TextFieldHelpers {
    static func this() -> NSAttributedString {
        let agreementLabelAttributes = NSMutableAttributedString(string:"By signing up you agree to our ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ])
        let underlinedAgreementLabelAttributes = NSMutableAttributedString(string:"Terms & Conditions", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ])
        let textRange = NSMakeRange(0, "Terms & Conditions".count)
        underlinedAgreementLabelAttributes.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
        agreementLabelAttributes.append(underlinedAgreementLabelAttributes)
        return agreementLabelAttributes
    }
    
    static func freeCashLabel() -> NSAttributedString {
        let freeCashLabelAttributes = NSMutableAttributedString(string:"✓ ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold),
            NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 101, blue: 245)
        ])
        let freeCashLabelAttributes2 = NSMutableAttributedString(string:" Free cash transfers from anyone on cowrywise", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular),
            NSAttributedString.Key.foregroundColor: GlobalVariables.textColor
        ])
        freeCashLabelAttributes.append(freeCashLabelAttributes2)
        return freeCashLabelAttributes
    }
    
    static func personalisedUsernameLabel() -> NSAttributedString {
        let personalisedUsernameLabelAttributes = NSMutableAttributedString(string:"✓ ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium),
            NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 101, blue: 245)
        ])
        let personalisedUsernameLabelAttributes2 = NSMutableAttributedString(string:" Personalized username link to receive cash \n" + "        " + "payments from anyone.", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular),
            NSAttributedString.Key.foregroundColor: GlobalVariables.textColor
        ])
        personalisedUsernameLabelAttributes.append(personalisedUsernameLabelAttributes2)
        return personalisedUsernameLabelAttributes
    }
}

class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
