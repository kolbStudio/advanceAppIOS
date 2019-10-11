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
    
    
    private func testLoadUsersJson() -> UsersDTO? {
        // Llamar al servicio
        if let path = Bundle.main.path(forResource: "users", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                return try decoder.decode(UsersDTO.self, from: jsonData)
            }
            catch let error {
                print("parse error: \(error.localizedDescription)")
                return nil
            }
        }
        else {
            print("Invalid filename/path.")
            return nil
        }
    }
    
    
    func fetchUsers(completion: ServiceCompletion) {
        
        // Llamar al servicio
        //Devolver datos
        
        if let users = testLoadUsersJson() {
            
            completion(.success(data: users))
        }
        else{
            
            completion(.failure(msg: "Error User File"))
        }
        
    }
    
    
    
}






