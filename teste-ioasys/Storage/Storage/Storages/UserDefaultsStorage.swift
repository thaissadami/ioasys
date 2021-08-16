//
//  UserDefaults.swift
//  Storage
//
//  Created by Thais Sadami on 13/08/21.
//

import Foundation

public class UserDefaultsStorage: UserDefaultsStoring {

    public let userDefaults: UserDefaults

    public required init(suitName: String) {
        self.userDefaults = UserDefaults(suiteName: suitName) ?? .standard
    }

    public required init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    public enum ValueKeyable: String, Keyable, CaseIterable {

        /// AppConfigResponse
        case appConfig
        /// Bool
        case firstLogin
        case isLoggedIn
        /// Int
        case remoteNotificationStatus

        public var key: String {
            return rawValue
        }
    }
}
