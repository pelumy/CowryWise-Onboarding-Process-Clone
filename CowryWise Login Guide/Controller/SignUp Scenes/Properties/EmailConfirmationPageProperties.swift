//
//  EmailConfirmationPageProperties.swift
//  CowryWise Login Guide
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

enum EmailConfirmationPageProperties {
    static let titleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: GlobalVariables.titleColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.boldSystemFont(ofSize: 35)
    ]
    static let subtitleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: GlobalVariables.subtitleColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.regular)
    ]
    static let inviteCodeLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor:GlobalVariables.linkColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
    ]
    static let backButton = "black_back_icon"
    static let titleLabel = "Please Confirm."
    static let subtitleLabel = "An account is about to be created with the email address below. Please make sure it's the correct email address."
    static let createAccountButton = "YES, CREATE MY ACCOUNT"
}
