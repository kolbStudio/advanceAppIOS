//
//  PictureDTO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation

struct PictureDTO: Codable {

let large: String?
let medium: String?
let thumbnail: String?





private enum CodingKeys: String, CodingKeys {
    case large
    case medium
    case thumbnail
   
    }
}

