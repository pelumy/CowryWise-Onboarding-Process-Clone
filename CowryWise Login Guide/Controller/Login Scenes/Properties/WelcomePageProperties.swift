//
//  WelcomePageProperties.swift
//  CowryWise Login Guide
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

enum WelcomePageProperties {
    static func welcomeMessage() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Hi Chioma\n\nGreat job on completing your sign up on Cowrywise! I can't wait to have you on such an amazing investment journey.\n\nMeeting your financial goals and the safety of your savings on Cowrywise matter to us. This is why your savings are held safely in trust with Meristem Trustees Limited, an SEC-registered trustee.\n\nThank you for choosing Cowrywise! We promise you an amazing experience.", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular),
            NSAttributedString.Key.foregroundColor: GlobalVariables.textColor
        ])
        attributedText.append(NSAttributedString(string: "\n\n𝓻𝓪𝓼𝓪𝓺  𝓪𝓱𝓶𝓮𝓭", attributes: [
            NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        let length = attributedText.string.count
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
        return attributedText
    }
    static let cancelButton = "black_cancel_icon"
    static let logo = "welcome_page_logo"
    
}
