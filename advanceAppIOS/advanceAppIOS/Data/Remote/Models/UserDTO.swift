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
    let name: NameDTO?
    let location: LocationDTO?
    let email: String? 
    let login: LoginDTO?
    let dob: DobDTO?
    let registered: DobDTO?
    let phone: Int?
    let cell: Int?
    //let id: idDTO?
    let picture: PictureDTO?
    let nat: String?
    
}

