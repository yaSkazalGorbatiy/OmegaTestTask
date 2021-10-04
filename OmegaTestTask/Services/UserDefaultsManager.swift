//
//  UserModel.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 29.09.2021.
//

import Foundation

class DataBase {
    
    static let shared = DataBase()

    enum SettingsKey: String {
        case users
        case activeUser
    }
    
    let defaults = UserDefaults.standard
    let usersKey = SettingsKey.users.rawValue
    let activeUserKey = SettingsKey.activeUser.rawValue
    
    var activeUser: User? {
        get {
            if let data = defaults.value(forKey: activeUserKey) as? Data {
                return try! PropertyListDecoder().decode(User.self, from: data)
            } else {
                return nil
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: activeUserKey)
            }
        }
    }
    
    func saveActiveUser(user: User) {
        activeUser = user
    }
    
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: usersKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: usersKey)
            }
        }
    }
    
    func saveUser(firstName: String, seconName: String, phone: String, email: String, password: String, age: Date) {
        
        let user = User(firstName: firstName, secondName: seconName, phone: phone, email: email, password: password, age: age)
        users.insert(user, at: 0)
    }
}
