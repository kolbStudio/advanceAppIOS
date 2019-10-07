//
//  UserDAO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation

import RealmSwift


class UserDAO: Object {
    
    // MARK: Declare Variables and optionals
    
  
    @objc dynamic var uuid: String = ""
    @objc dynamic var gender: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var country: String?
    @objc dynamic var email: String?
    @objc dynamic var birthdate: Date?
    @objc dynamic var avatar : String?
    @objc dynamic var latitude : String?
    @objc dynamic var longitude : String?
 
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
                

convenience init (uuid: String,
                  avatar: String? = nil,
                  firstName: String? = nil,
                  lastName: String? = nil,
                   email: String? = nil,
                   gender: String? = nil,
                   birthdate: Date? = nil,
                   country: String? = nil,
                   latitude: String? = nil,
                   longitude: String? = nil) {

    self.init()

    self.uuid = uuid
    self.avatar = avatar
    self.firstName = firstName
    self.lastName = lastName
    self.gender = gender
    self.birthdate = birthdate
    self.country = country
    self.latitude  = latitude
    self.longitude = longitude
    
    
    
    
}
}
