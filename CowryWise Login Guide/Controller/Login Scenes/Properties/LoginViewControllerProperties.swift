//
//  LoginViewControllerProperties.swift
//  CowryWise Login Guide
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

enum LoginPageButtons {
    static let cancelButtonImage = "white_cancel_icon"
    static let loginButtonText = "LOGIN"
}

enum LoginPageTexts {
    static let titleLabelText = "Log In."
    static let subtitleLabelText = "It's a good day to save."
    static let showPasswordLabel = "Show Password"
    static let forgotPasswordLabel = "Forgot Password?"
    static let emailTextField = "Email"
    static let passwordTextField = "Password"
}

enum LoginPageAttributes {
    static let titleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white,
        .font: UIFont.boldSystemFont(ofSize: 40)
    ]
    static let loginFormPlaceholders = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 121, green: 173, blue: 244), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)])
    static let subtitleLabelAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
    ]
    static let emptyPlaceholder = NSAttributedString(string: "",attributes: [NSAttributedString.Key.foregroundColor: UIColor.clear, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 0, weight: UIFont.Weight.regular)])
}
