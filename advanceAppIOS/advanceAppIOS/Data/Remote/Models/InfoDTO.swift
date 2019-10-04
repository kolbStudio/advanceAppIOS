//
//  InfoDTO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


struct InfoDTO: Codable {
    
    let seed: String?
    let page: Int?
    let version: String?
    let count: Int?
    
    
    
    private enum CodingKeys: String, CodingKeys {
        case seed
        case page
        case version
        case count = "results"
        }
    }

