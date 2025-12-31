//
//  NewsDetailBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

final class NewsDetailBuilder: ModuleBuilder {
    var contentView: NewsDetailCV
    var viewModel: NewsDetailVM
    var viewController: NewsDetailVC
    
    required init(services: Services) {
        contentView = NewsDetailCV()
        viewModel = NewsDetailVM()
        viewModel.services = services
        viewController = NewsDetailVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> NewsDetailVC {
        return viewController
    }
}
