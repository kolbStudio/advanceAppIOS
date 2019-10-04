//
//  UserDTO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


struct UserDTO: Codable {
    
    let gender: String?
    let name: userNameDTO?
    let location: locationDTO?
    let email: String? 
    //let login: loginDTO?
    let dob: dobDTO?
    let registered: dobDTO?
    let phone: int?
    let cell: int?
    //let id: idDTO?
    let picture: pictureDTO?
    let nat: String?
    
    
    
    
    private enum CodingKeys: String, CodingKeys {
            case name
            case location
            case email
            //case login
            case dob
            case registered
            case phone
            case cell
            //case id
            case picture
            case nat
    }
}
