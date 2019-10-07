//
//  ApiManager.swift
//  advanceAppIOS
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation


enum ServiceResult {
    case success(data: Any?)
    
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()

  

class ApiManager {
    

    //MARK: - Singleton declaration
    static let shared = ApiManager()
    private init() {}
    
    private let numUsers: Int = 100
    
    
    func fetchUsers(completion: ServiceCompletion) {
        
        // Llamar al servicio
        
        //Devolver datos
        completion(.success(data: "Bieeeen"))
        
            
        }
    }
    
    

