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
                
}
    
    
    
    
    

