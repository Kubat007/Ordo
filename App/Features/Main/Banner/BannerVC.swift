//
//  BannerVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 26/1/26.
//

import UIKit
import Foundation

final class BannerVC: BaseVC<BannerCV, BannerVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        guard let model = viewModel.model else { return }
        contentView.configure(with: model)
        contentView.backgroundColor = .clear
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}
