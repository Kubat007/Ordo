//
//  AuthVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

final class AuthVC: BaseVC<AuthCV, AuthVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = ""
        view.backgroundColor = .white
        setupActions()
    }
    
    private func setupActions() {
        contentView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        contentView.termsCheckbox.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        guard contentView.termsCheckbox.isSelected else {
            toast(with: "Необходимо согласиться с условиями сервиса", messageType: .warning)
            return
        }
        
        let phone = contentView.phoneTextField.getCleanText()
        
        guard !phone.isEmpty else {
            toast(with: "Введите номер телефона", messageType: .warning)
            return
        }
        viewModel.login(phone: "+996\(phone)")
    }
    
    @objc private func checkboxTapped() {
        contentView.termsCheckbox.isSelected.toggle()
    }
    
    @objc private func countryCodeTapped() {
        print("Country code picker")
    }
}

extension AuthVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AuthVC: AuthVMDelegate {
    func successLogin(phone: String) {
        viewModel.onVerifyAction?(phone)
    }
    
    func failure(with error: String) {
        toast(with: "error \(error.description)", messageType: .error)
    }
}
