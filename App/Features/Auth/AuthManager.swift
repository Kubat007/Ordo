//
//  AuthManager.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 24/12/25.
//

import UIKit

class AuthManager {
    static let shared = AuthManager()
    private let tokenKey = "accessToken"
    var isLoggedIn: Bool {
        return getToken() != nil
    }
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }
    
    func clearToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
