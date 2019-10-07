//
//  DatabaseManager.swift
//  advanceAppIOS
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import Foundation
import RealmSwift


class DatabaseManager {
    //MARK: - Singleton declaration
    static let shared = DatabaseManager()
    private init() {}
    

    //MARK: - Singleton declaration
    // Get the default Realm database
    
    private let realm = try! Realm()
    
    func save(user: UserDAO) {
        try! realm.write {
            realm.add(user,
                      update: .modified)
        }
    }
    
    func users() -> Results<UserDAO> {
        
        return realm.objects(UserDAO.self)
        
    }
    
    func user(by id: String) -> UserDAO? {
        
         return realm.object(ofType: UserDAO.self, forPrimaryKey: id)
        
        
    }
    
    func deleteAll() {
        
        try! realm.write{
        realm.deleteAll()
        }
    }
    func delete(user: UserDAO) {
        try! realm.write{
        realm.delete(user)
    }
  }

}
