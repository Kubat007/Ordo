//
//  AuthVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

protocol AuthVMDelegate: AnyObject {
    func successLogin(phone: String)
    func failure(with error: String)
}

import Foundation

final class AuthVM: BaseVM {
    var services: Services!
    weak var delegate: AuthVMDelegate?
    var onBackAction: DefaultNavigationCallback?
    var onVerifyAction: ((_ phoneNumber: String) -> Void)?
    
    @MainActor
    func login(phone: String) {
        loginUser(phone: phone)
    }
    
    @MainActor
    private func loginUser(phone: String) {
        Task {
            do {
                _ = try await self.services?.repository.auth.sendPhoneNumber(with: phone)
                delegate?.successLogin(phone: phone)
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}
