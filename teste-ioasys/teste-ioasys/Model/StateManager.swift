//
//  StateManager.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 24/06/21.
//

import Foundation

class StateManager: NSObject {
    
    var email: String?
    var password: String?
    
    private(set) static var sharedManager = StateManager()

    fileprivate override init() {
        super.init()
    }
    
    func logout(){
        self.email = nil
        self.password = nil
    }
    
    static func resetManager() {
        sharedManager = StateManager()
    }
    
    func setEmail(email: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.synchronize()
    }
    
    func getEmail() -> [String]? {
        return UserDefaults.standard.string(forKey: "email")
    }

    func password(password: String) {
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
    
    func getPassword() -> [String]? {
        return UserDefaults.standard.string(forKey: "password")
    }
    
}
