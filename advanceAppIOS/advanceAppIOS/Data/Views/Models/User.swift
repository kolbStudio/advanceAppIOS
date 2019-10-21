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
    let birthdate: Date?
    let country: String?
    let nationality: String?
    let username: String?
    let gender: String?
    let salt: String?
    let cell: String?
    let postalCode: String?
    let city: String?
    let state: String?
    let longitude: String?
    let latitude: String?
    
    
    var flag: String {
        get {
            guard let nat = nationality else{
                return ""
            }
            let base: UInt32 = 127397
            var s = ""
            for v in nat.unicodeScalars {
                s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
            }
            return String(s)
        }
    }
    
    var name: String {
        var name = ""
        if let userFirstName = firstName {
            name += userFirstName
        }
        
        if let userLastName = lastName {
            name += (name.count > 0 ? " \(userLastName)": userLastName)
        }
        
        return "\(name)"
    }
    
    var age: Int {
        guard let date = birthdate,
            let yearAge = Calendar.current.dateComponents([.year],
                                                          from: date, to: Date()).year else {
                                                            return 0
        }
        
        return yearAge
    }
    
    
    
    init(id: String,
         avatar: String? = nil,
         firstName: String? = nil,
         lastName: String? = nil,
         email: String? = nil,
         birthdate: Date? = nil,
         country: String? = nil,
         nationality: String? = nil,
         username: String? = nil,
         gender: String? = nil,
         postalCode:String? = nil,
         city: String? = nil,
         salt: String? = nil,
         state: String? = nil,
         cell: String? = nil,
         latitude: String? = nil,
         longitude: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthdate = birthdate
        self.country = country
        self.nationality = nationality
        self.username = username
        self.gender = gender
        self.city = city
        self.postalCode = postalCode
        self.salt = salt
        self.cell = cell
        self.state = state
        self.longitude = longitude
        self.latitude = latitude
        
        
        
    }
    
}
