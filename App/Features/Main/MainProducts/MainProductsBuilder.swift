//
//  MainProductsBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 9/2/26.
//

final class MainProductsBuilder: ModuleBuilder {
     var contentView: MainProductsCV
     var viewModel: MainProductsVM
     var viewController: MainProductsVC
    
    required init(services: Services) {
        contentView = MainProductsCV()
        viewModel = MainProductsVM()
        viewModel.services = services
        viewController = MainProductsVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> MainProductsVC {
        return viewController
    }
}
