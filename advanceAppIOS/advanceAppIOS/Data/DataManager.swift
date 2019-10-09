//
//  DataManager.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation

class DataManager {
    // MARK: - Singleton declaration
    static let shared = DataManager()
    private init() {}
    
    
    func users(completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let users = self?.usersDB(), users.count > 0 {
                // devolver userDB
                DispatchQueue.main.async {
                    completion(.success(data: users))
                }
            }
            else {
                // llamar al servicio y guardar usuarios
                // en base de datos
                self?.usersForceUpdate(completion: completion)
            }
        }
    }
    
    func usersForceUpdate(completion: @escaping ServiceCompletion) {
        // Llamar al servicio para obtener nuevos usuarios
        DispatchQueue.global(qos: .background).async {
            ApiManager.shared.fetchUsers() { [weak self] result in
                switch result {
                    case .success(let data):
                        guard let users = data as? UsersDTO else {
                            DispatchQueue.main.async {
                                completion(.failure(msg: "Mensaje error genérico"))
                            }
                            return
                        }
                        
                        // Eliminar todos los usuarios de la base de datos
                        DatabaseManager.shared.deleteAll()
                        // Guardar usuarios en la base de datos
                        self?.save(users: users)
                        
                        DispatchQueue.main.async {
                            completion(.success(data: users))
                        }
                    
                    case .failure(let msg):
                        print("Fallo al obtener usuarios del servicio: \(msg)")
                    
                        DispatchQueue.main.async {
                            completion(.failure(msg: msg))
                        }
                }
            }
        }
    }
    
    func user(by id: String, completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async {
            let userDAO = DatabaseManager.shared.user(by: id)
            
            DispatchQueue.main.async {
                completion(.success(data: userDAO))
            }
        }
    }
    
    
    private func usersDB() -> Array<UserDAO> {
        return Array(DatabaseManager.shared.users())
    }
    
    private func save(users: UsersDTO) {
        guard let usersToSave = users.users else {
            return
        }
        
        usersToSave.forEach{ save(user: $0) }
    }
    
    private func save(user: UserDTO) {
        guard let userId = user.login?.uuid else {
            return
        }
        
        let userDB = UserDAO(uuid: userId,
                             avatar: user.picture?.large,
                             firstName: user.name?.first,
                             lastName: user.name?.last,
                             email: user.email,
                             gender: user.gender,
                             birthdate: user.dob?.date,
                             country: user.location?.country,
                             latitude: user.location?.coordinates?.latitude,
                             longitude: user.location?.coordinates?.longitude,
                             nationality: user.nat)
        
        DatabaseManager.shared.save(user: userDB)
    }
}

//class DataManager {
//    //MARK: - Singleton declaration
//    static let shared = DataManager()
//    private init() {}
//
//
//    //MARK: - Functions
//    func users(completion: @escaping ServiceCompletion) {
//
//        DispatchQueue.global(qos: .background).async{ [weak self] in
//            if let usersDAO = self?.usersDB(), usersDAO.count > 0 {
//                // converrtir listado de userDAO a listado de User
//                let users = self?.users(from: usersDAO)
//                //devolver userDB
//                DispatchQueue.main.async {
//                completion(.success(data: users))
//                }
//            }
//            else{
//                //llamar al servicio y guardar usarios en la base de datos
//                self?.usersForceUpdate(completion: completion)
//            }
//        }
//    }
//
//
//
//    func usersForceUpdate(completion: @escaping ServiceCompletion) {
//        //llamar al servicio y guardar usarios en la base de datos
//
//        DispatchQueue.global(qos: .background).async {
//
//            ApiManager.shared.fetchUsers() { [weak self] result in
//                switch result {
//                case .success(let data):
//                    guard let users = data as? UsersDTO else {
//                        DispatchQueue.main.async {
//                            completion(.failure(msg:"Mensaje error generico"))
//                        }
//                        return
//                    }
//
//                    // Eliminar todos los usuarios de la base de datos
//                    DatabaseManager.shared.deleteAll()
//                    //guardar los nuevos usuarios
//                    self?.save(users: users)
//
//                    DispatchQueue.main.async {
//
//                        completion(.success(data: users))
//                    }
//
//
//
//                case .failure(let msg):
//                    print("Fallo al obtener usuarios del Servicio: \(msg)")
//                    DispatchQueue.main.async {
//                        completion(.failure (msg: msg))
//                    }
//
//                }
//
//            }
//        }
//
//    }
//
//    func user(by id: String, completion: @escaping ServiceCompletion)  {
//
//           DispatchQueue.global(qos: .background).async { [weak self] in
//
//               if let userDAO = DatabaseManager.shared.user(by: id) {
//
//                   let user = self?.user(by: userDAO)
//
//                   DispatchQueue.main.async {
//                       completion(.success(data: user))
//
//                }
//
//               }
//               else {
//                   self?.usersForceUpdate(completion: completion)
//               }
//           }
//       }
//     //MARK: - Private Functions
//    private func users(from usersDAO: Array<UserDAO>) -> Array<User> {
//        return usersDAO.compactMap { userDAO in
//            return self.convertUser(from: userDAO)
//        }
//
//    }
//
//    private func usersDB() -> Array <User> {
//        guard let usersDAO = usersDB()
//        //devolver userDB
//        return users(from: usersDB())
//
//        else {
//            DispatchQueue.main.async {
//                completion(.success(data: user))
//
//            }
//        }
//    }
//
//    private func convertUser(from userDAO: UserDAO) -> User {
//
//        return User(id: userDAO.uuid,
//        avatar: userDAO.avatar,
//        firstName: userDAO.firstName,
//        lastName: userDAO.lastName,
//        email: userDAO.email,
//        birthdate: userDAO.birthdate,
//        country: userDAO.country,
//        nationality: userDAO.nationality)
//
//    }
//    private func usersDB() -> Array<UserDAO> {
//        return Array(DatabaseManager.shared.users())
//    }
//
//    private func save(users: UsersDTO) {
//
//        guard let usersToSave = users.users else {
//            return
//        }
//        usersToSave.forEach{ save(user: $0) }
//    }
//
//    private func save(user: UserDTO) {
//        guard let userID = user.login?.uuid else {
//            return
//        }
//
//        let userDB = UserDAO(uuid: userID,
//                             avatar: user.picture?.large,
//                             firstName: user.name?.first,
//                             lastName: user.name?.last,
//                             email: user.email,
//                             gender: user.gender,
//                             birthdate: user.dob?.date,
//                             country: user.location?.country,
//                             latitude: user.location?.coordinates?.latitude,
//                             longitude: user.location?.coordinates?.longitude,
//                             nationality: user.nat)
//
//        DatabaseManager.shared.save(user: userDB)
//    }
//
//}

