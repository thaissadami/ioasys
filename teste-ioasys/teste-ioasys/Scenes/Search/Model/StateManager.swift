//
//  StateManager.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 24/06/21.
//
import Foundation

class StateManager: NSObject {
    
    var userLogged: Bool?
    var accessToken: String?
    var client: String?
    var uid: String?
    
    private(set) static var sharedManager = StateManager()

    fileprivate override init() {
        super.init()
    }
    
    func logout(){
        self.accessToken = nil
        self.client = nil
        self.uid = nil
        self.userLogged = false
    }
    
    static func resetManager() {
        sharedManager = StateManager()
    }
    
    func setUserLogged(userLogged: Bool) {
        UserDefaults.standard.set(userLogged, forKey: "userLogged")
        UserDefaults.standard.synchronize()
    }
    
    func getUserLogged() -> Bool {
        return UserDefaults.standard.bool(forKey: "userLogged")
    }
    
    func setAccessToken(accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: "accessToken")
        UserDefaults.standard.synchronize()
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: "accessToken")
    }

    func setClient(client: String) {
        UserDefaults.standard.set(client, forKey: "client")
        UserDefaults.standard.synchronize()
    }
    
    func getClient() -> String? {
        return UserDefaults.standard.string(forKey: "client")
    }

    func setUID(uid: String) {
        UserDefaults.standard.set(uid, forKey: "uid")
        UserDefaults.standard.synchronize()
    }
    
    func getUID() -> String? {
        return UserDefaults.standard.string(forKey: "uid")
    }
    
}
