//
//  ApiManager.swift
//  advanceAppIOS
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//
import Foundation
import Alamofire


enum ServiceResult {
    case success(data: Any?)
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()


class ApiManager {
    // MARK: - Singleton declaration
    static let shared = ApiManager()
    private init() {}
    
    private let url_users = "https://randomuser.me/api/"
    private let serviceResultDateFormat: String? = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    private let serviceKeyResults: String = "results"
    private let numUsers: Int = 100
    private var testLoadUsersJson: UsersDTO? {
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
    
    func fetchUsers(completion: @escaping ServiceCompletion) {
        // Llamar al servicio
        Alamofire.request(url_users,
                          method: .get,
                          parameters: [serviceKeyResults: numUsers],
                          encoding: URLEncoding.queryString).response { [weak self] response in
            if let responseData = response.data {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = self?.serviceResultDateFormat
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let users: UsersDTO? = try? decoder.decode(UsersDTO.self, from: responseData)
                let usersOrdered = users?.users?.sorted(by: { $0.dob?.age ?? 0 < $1.dob?.age ?? 0 })
                
                completion(.success(data: UsersDTO(users: usersOrdered,
                                                   info: users?.info)))
            }
            else {
                completion(.failure(msg: "Error en peticiÛn al servicio"))
            }
        }
    }
}
