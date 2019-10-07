//
//  DataManager.swift
//  advanceAppIOS
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation



class DataManager {
    //MARK: - Singleton declaration
    static let shared = DataManager()
    private init() {}
    
    
    
    func users() {
       if usersDB().count > 0 {
            
        //devolver userDB
        }
        else{
            
            //llamar al servicio y guardar usarios en la base de datos
        }
    }

    func usersUpdate() {
        //llamar al servicio y guardar usarios en la base de datos
        ApiManager.shared.fetchUsers() { result in
          switch result {
              case .success(let data):
                guard let users = data as? UsersDTO
                    else {
                        return
                }
                
                // Eliminar todos los usuarios de la base de datos
                               DatabaseManager.shared.deleteAll()
                           //guardar los nuevos usuarios
                           save(users: users)
                
               case .failure(let msg):
                   print("Fallo al obtener usuarios del Servicio: \(msg)")
            
            }
      }
}
    
    
    func user(id: String) -> UserDAO? {
        return DatabaseManager.shared.user(by: id)
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
        guard let userID = user.login?.uuid else {
            return
        }
        
        let userDB = UserDAO(uuid: userID,
                             avatar: user.picture?.large,
                             firstName: user.name?.first,
                             lastName: user.name?.last,
                             email: user.email,
                             gender: user.gender,
                             birthdate: user.dob?.date,
                             country: user.location?.country,
                             latitude: user.location?.coordinates?.latitude,
                             longitude: user.location?.coordinates?.longitude)
        
        DatabaseManager.shared.save(user: userDB)
    }
       
    }

