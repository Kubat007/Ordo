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
        title = ""
        view.backgroundColor = .white
        setupActions()
//        contentView.phoneTextField.delegate = self
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
        guard let phone = contentView.phoneTextField.textField.text, !phone.isEmpty else {
            toast(with: "Введите номер телефона", messageType: .warning)
            return
        }
        viewModel.login(phone: phone)
    }
    
    @objc private func checkboxTapped() {
        print("test")
        contentView.termsCheckbox.isSelected.toggle()
    }
    
    @objc private func countryCodeTapped() {
        // Здесь можно открыть picker для выбора страны
        print("Country code picker")
    }
}

extension AuthVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
