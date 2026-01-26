//
//  BannerBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 26/1/26.
//

final class BannerBuilder: ModuleBuilder {
     var contentView: BannerCV
     var viewModel: BannerVM
     var viewController: BannerVC
    
    required init(services: Services) {
        contentView = BannerCV()
        viewModel = BannerVM()
        viewModel.services = services
        viewController = BannerVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> BannerVC {
        return viewController
    }
}
