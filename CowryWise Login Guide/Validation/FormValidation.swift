//
//  FormValidation.swift
//  CowryWise Login Guide
//
//  Created by mac on 03/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class FormValidation {
    public func validateFirstName(_ firstName: String) ->Bool {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        let nameRegex = "^\\w{3,18}$"
        let trimmedString = firstName.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidFirstName = validateName.evaluate(with: trimmedString)
        return isValidFirstName
    }
    public func validateLastName(_ lastName: String) ->Bool {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        let nameRegex = "^\\w{3,18}$"
        let trimmedString = lastName.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidLastName = validateName.evaluate(with: trimmedString)
        return isValidLastName
    }
    
    public func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhoneNumber = validatePhone.evaluate(with: trimmedString)
        return isValidPhoneNumber
    }
    public func validateEmailAddress(_ emailAddress: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = emailAddress.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidEmail = validateEmail.evaluate(with: trimmedString)
        return isValidEmail
    }
    public func validatePassword(_ password: String) -> Bool {
        //Minimum 8 characters at least 1 Alphabet and 1 Number:
        let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        let isvalidPassword = validatePassord.evaluate(with: trimmedString)
        return isvalidPassword
    }
    public func validateAnyOtherTextField(_ otherField: String) -> Bool {
        let otherRegexString = "Your regex String"
        let trimmedString = otherField.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", otherRegexString)
        let isValidOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidOtherString
    }
}
