//
//  SetUsernameProperties.swift
//  CowryWise Login Guide
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

enum SetUsernameProperties {
    static let titleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: GlobalVariables.titleColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.boldSystemFont(ofSize: 35)
    ]
    static let subtitleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: GlobalVariables.subtitleColor,
        .backgroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.light)
    ]
    static let inviteCodeLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor:UIColor.rgb(red: 0, green: 100, blue: 237),
        .backgroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
    ]
    static let backButton = "black_back_icon"
    static let titleLabel = "Set your username"
    static let subtitleLabel = "We suggested one for you, but you can choose anything else."
    static let userNameTextField = "@mmegwaamanda"
    static let continueButton = "CONTINUE"
    static let importanceLabel =  "How important is my username?"
}
