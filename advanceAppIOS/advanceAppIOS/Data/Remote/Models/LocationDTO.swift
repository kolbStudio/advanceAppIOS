//
//  LocationDTO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


struct LocationDTO: Codable {

let street: String?
let state: String?
let country: String? 
let postCode: Int?





private enum CodingKeys: String, CodingKeys {
    case city
    case state
    case country
    case postCode
    }
}
