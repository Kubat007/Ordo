//
//  ProfileVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

final class ProfileVC: BaseVC<ProfileCV, ProfileVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .systemBackground
        contentView.authButton.addTarget(self, action: #selector(authTapped), for: .touchUpInside)
    }
    
    @objc private func authTapped() {
        viewModel.onAuthAction?()
    }
}
