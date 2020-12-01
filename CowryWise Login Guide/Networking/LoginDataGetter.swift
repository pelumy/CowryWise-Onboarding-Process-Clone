//
//  LoginDataGetter.swift
//  CowryWise Login Guide
//
//  Created by mac on 02/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class LoginDataGetter  {
    var loginDataDelegate: LoginDataProtocol?
    
    public func getData() {
        let session = URLSession.shared
        guard let url = URL(string: "\(API.loginAPI)/login") else{ return }
        var loginRequest = URLRequest(url: url)
        loginRequest.httpMethod = "POST"
        do{
            let parameters = ["emailAddress": "chavitunu@gmail.com", "password": "Buzzysat1"]
            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .init())
            let task = session.dataTask(with: loginRequest) {(data,response, error) in
                
                if let data = data {
                    do{
                        let json = try JSONDecoder().decode(LoginDataModel.self, from: data)
                        self.loginDataDelegate?.getLoginData(response: json)
                    }
                    catch {
                        print("JSON error: \(error)")
                    }
                }
                if let error = error {
                    print(error)
                }
                return
            }
            task.resume()
        }
        catch {
            print("Failed to serialize data", error)
        }
    }
}
