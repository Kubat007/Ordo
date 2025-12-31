//
//  NewsDetailVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

import UIKit

final class NewsDetailVC: BaseVC<NewsDetailCV, NewsDetailVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupUI()
        
        contentView.backButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.backButton.setImage(Asset.Images.navBackButton.image.withRenderingMode(.alwaysTemplate), for: .normal)
        contentView.backButton.tintColor = Asset.Colors.black.color
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        viewModel.getNews()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension NewsDetailVC: NewsDetailVMDelegate {
    func successDetail(model: ProfileModel.Response.NewsDetailModel) {
        contentView.configure(with: model)
    }
    
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
}
