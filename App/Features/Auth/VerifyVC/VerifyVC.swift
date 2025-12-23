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
        title = ""
        view.backgroundColor = .white
        setupActions()
    }
    
    private func setupActions() {
        contentView.confirmButton.addTarget(
            self,
            action: #selector(confirmTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func confirmTapped() {
        print("Confirm SMS code")
    }
}
