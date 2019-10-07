//
//  LocationDTO.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


struct LocationDTO: Codable {
    
    let city: String?
    let coordinates: CoordinatesDTO?
    let street: String?
    let state: String?
    let country: String?
    let postCode: Int?
    let timezone: TimezoneDTO?
    let latitude: String?
    let longitude: String?


}
