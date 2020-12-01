//
//  Profile.swift
//  CowryWise Login Guide
//
//  Created by mac on 02/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

struct ProfileResponseModel: Codable {
    let id, firstName, lastName, username: String
    let gender: Bool
    let dateOfBirth, nextOfKin, postalAddress, email: String
    let phoneNumber: String
    
}
