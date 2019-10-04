//
//  RegisteredDTO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


struct RegisteredDTO: Codable {

let date: String?
let age: Int?





private enum CodingKeys: String, CodingKeys {
    case date
    case age
   
    }
}
