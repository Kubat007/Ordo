//
//  VerifyVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 23/12/25.
//

import UIKit

final class VerifyVC: BaseVC<VerifyCV, VerifyVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = ""
        view.backgroundColor = .white
        setupActions()
    }
    
    private func setupActions() {
        contentView.confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
    }
    
    @objc private func confirmTapped() {
        let code = contentView.getCode()
        if code.count == 4 {
            viewModel.loginUser(code: code)
        }
    }
}

extension VerifyVC: VerifyVMDelegate {
    func successLogin(token: String) {
        viewModel.onProfileAction?()
    }
    
    func failure(with error: String) {
        toast(with: "error \(error.description)", messageType: .error)
    }
}
