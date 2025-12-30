//
//  NewsBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

final class NewsBuilder: ModuleBuilder {
    var contentView: NewsCV
    var viewModel: NewsVM
    var viewController: NewsVC
    
    required init(services: Services) {
        contentView = NewsCV()
        viewModel = NewsVM()
        viewModel.services = services
        viewController = NewsVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> NewsVC {
        return viewController
    }
}
