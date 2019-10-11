//
//  User.swift
//  advanceAppIOS
//
//  Created by Dev2 on 08/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


class User {
    
    let id: String
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let country: String?
    let birthdate: Date?
    let nationality: String?
    
    var name: String {
        var userName = ""
        if let userFirstName = firstName {
            userName += userFirstName
        }
        
        
        if let userLastName = lastName {
            userName += (userName.count > 0 ? " \(userLastName)":userLastName)
        }
        return"\(userName)"
    }
    
    var age: Int {
        
        guard let date = birthdate else {
            return 0
        }
        let years = Calendar.current.dateComponents([.year], from: date, to: Date())
        
        return years.year ?? 0
        
    }
    
    
    init(
        id: String,
        avatar: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        email: String? = nil,
        birthdate: Date? = nil,
        country: String? = nil,
        nationality: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthdate = birthdate
        self.country = country
        self.nationality = nationality
    }
    
    
    
}

