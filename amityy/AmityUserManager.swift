//
//  AmityUserManager.swift
//  amityy
//
//  Created by Ritesh Sinha on 28/05/24.
//

import Foundation
import AmitySDK
import AmityUIKit

//class AmityUserManager {
//    static let shared = AmityUserManager()
//    private init() {}
//    var currentUserId: String?
//    func registerUser(userId: String, displayName: String, completion: @escaping (Bool, Error?) -> Void) {
//        AmityUIKitManager.register(userId: userId, displayName: displayName, authToken: nil) { (success, error, sessionHandler) in
//            if success {
//                self.currentUserId = userId
//                sessionHandler?()
//            }
//            completion(success, error)
//        }
//    }
//    func logoutUser(completion: @escaping (Bool, Error?) -> Void) {
//        AmityUIKitManager.unregister { (success, error) in
//            if success {
//                self.currentUserId = nil
//            }
//            completion(success, error)
//        }
//    }
//    func isUserRegistered() -> Bool {
//        return currentUserId != nil
//    }
//}
