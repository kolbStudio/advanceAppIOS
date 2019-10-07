//
//  LoginDTO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


struct LoginDTO: Codable {

let uuid: String?
let userName: String?
let password: String?
let salt: String?
let md5: String?
let sha1: String?
let sha256: String?

}
