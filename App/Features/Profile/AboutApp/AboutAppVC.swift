//
//  AboutAppVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/2/26.
//

import UIKit

final class AboutAppVC: BaseVC<AboutAppCV, AboutAppVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.navigationBar.leftButton.addTarget(
            self,
            action: #selector(onBack),
            for: .touchUpInside
        )
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        
        contentView.setData(
            devDate: "01 январь 2025г",
            contact: "Эльбрус Мамедов",
            version: version
        )
    }
    
    @objc private func onBack() {
        viewModel.onBackAction?()
    }
}
