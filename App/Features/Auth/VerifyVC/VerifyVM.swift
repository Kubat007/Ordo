//
//  VerifyVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit

protocol VerifyVMDelegate: AnyObject {
    func successLogin(token: String)
    func failure(with error: String)
}

final class VerifyVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    weak var delegate: VerifyVMDelegate?
    var phoneNumber: String?
    var onProfileAction: (() -> Void)?
    
    @MainActor
    func loginUser(code: String) {
        Task {
            do {
                let initialize = try await self.services?.repository.auth.verifyPhoneNumber(with: phoneNumber ?? "", code: code)
                if let token = initialize?.message {
                    AuthManager.shared.saveToken("Token \(token)")
                    delegate?.successLogin(token: token)
                }
            } catch {
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
}
