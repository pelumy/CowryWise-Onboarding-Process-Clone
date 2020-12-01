//
//  StringConstants.swift
//  CowryWise Login Guide
//
//  Created by mac on 02/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit
enum GlobalVariables {
    static let titleColor = UIColor.rgb(red: 37, green: 56, blue: 88)
    static let subtitleColor = UIColor.rgb(red: 80, green: 96, blue: 121)
    static let linkColor = UIColor.rgb(red: 0, green: 122, blue: 255)
    static let textColor = UIColor.rgb(red: 80, green: 96, blue: 121)
    static let profileBackButton = "profile_page_back_button"
}

enum LandingPageVariables {
    static let title1 = "Welcome to Cowrywise."
    static let title2 = "Plan your finances"
    static let title3 = "Save for the future"
    static let title4 = "Invest with ease"
    
    static let message1 = "We help you save and invest your money to achieve your financial goals."
    static let message2 = "Use our simple money tools to plan for tomorrow."
    static let message3 = "Save towards your goals and learn financial discipline along the way."
    static let message4 = "Invest in top mutual funds with as little as NGN 100 to grow your wealth."

    static let imageName1 = "logo"
    static let imageName2 = "calender"
    static let imageName3 = "cowry_coin"
    static let imageName4 = "treeCoin"
}

enum LandingPageButtons{
    static let loginTitle = "LOGIN"
    static let signupTitle = "SIGN UP"
}

enum RegisteredCells {
    static let cellId = "cellId"
}

enum API {
    static let profileAPI =  "https://5f7505151cf3c900161cdb66.mockapi.io/api/v1/"
    static let signupAPI = "https://5f7505151cf3c900161cdb66.mockapi.io/api/v1/signup"
    static let loginAPI = "https://5f7505151cf3c900161cdb66.mockapi.io/api/v1"
}



