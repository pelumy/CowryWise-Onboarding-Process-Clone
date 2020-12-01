//
//  ProfileResponseDataLoader.swift
//  CowryWise Login Guide
//
//  Created by mac on 02/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//
import  UIKit
class ProfileResponseDataLoader  {
    var profileResponseDelegate: ProfileResponseProtocol?
    
    public func getData() {
        let id : Int = 1
        let session = URLSession.shared
        guard let url = URL(string: "\(API.profileAPI)/profile/\(id)") else{ return }
        
        let task = session.dataTask(with: url) {  (data, response, error) in
            guard let data = data, error == nil else {
                print("error in parsing data")
                return
            }
            do {
                let json = try JSONDecoder().decode(ProfileResponseModel.self, from: data)
                self.profileResponseDelegate?.getProfileData(data: json)
            }
            catch {
                print("JSON error>>>>>>>>>>>>>>>>>>: \(error)")
            }
        }
        task.resume()
    }
}
