//
//  AuthVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import Foundation

protocol AuthVMDelegate: AnyObject {
    func didLoginSuccess()
    func didLoginFail(with error: String)
}

final class AuthVM: BaseVM {
    var services: Services!
    weak var delegate: AuthVMDelegate?
    var onBackAction: DefaultNavigationCallback?
    
    @MainActor
    func login(phone: String) {
        // Здесь будет логика авторизации
        print("Login with phone: \(phone)")
        
        // Пример вызова API
        loginUser(phone: phone)
    }
    
    @MainActor
    private func loginUser(phone: String) {
        Task {
            do {
                // Пример запроса
                // let response = try await services?.repository.auth.login(phone: phone)
                // delegate?.didLoginSuccess()
                
                // Временная заглушка
                try await Task.sleep(nanoseconds: 1_000_000_000)
                delegate?.didLoginSuccess()
            } catch {
                delegate?.didLoginFail(with: error.localizedDescription)
            }
        }
    }
}
