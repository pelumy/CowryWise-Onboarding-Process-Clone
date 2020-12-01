//
//  SigningupProperties.swift
//  CowryWise Login Guide
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

enum SigningupProperties {
    static let titleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: GlobalVariables.titleColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.boldSystemFont(ofSize: 35)
    ]
    static let subtitleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: GlobalVariables.subtitleColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
    ]
    static let inviteCodeLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor:GlobalVariables.linkColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
    ]
    static let cancelButton = "black_cancel_icon"
    static let titleLabel = "Tell us about you."
    static let subtitleLabel = "Let's create your investment account."
    static let firstNameTextField = "Firstname"
    static let lastNameTextField = "Lastname"
    static let emailTextField = "Email"
    static let passwordTextField = "Password"
    static let phoneNumberTextField = "Phone Number"
    static let continueButton = "CONTINUE"
    static let inviteCodeLabel = "Got an invite code?"
}
