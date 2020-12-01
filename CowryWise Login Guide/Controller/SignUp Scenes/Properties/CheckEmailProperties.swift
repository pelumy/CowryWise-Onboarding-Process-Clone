//
//  CheckEmailProperties.swift
//  CowryWise Login Guide
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

enum CheckEmailProperties {
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
    static let backButton = "black_cancel_icon"
    static let titleLabel = "Check Your Email."
    static let subtitleLabel = "To complete your registration, please proceed to check your email for a verification link."
    static let verifiedEmailButton = "I HAVE VERIFIED MY EMAIL"
    
}
