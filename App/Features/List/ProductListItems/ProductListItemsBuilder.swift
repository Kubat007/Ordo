//
//  ProductListItemsBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 11/2/26.
//

final class ProductListItemsBuilder: ModuleBuilder {
     var contentView: ProductListItemsCV
     var viewModel: ProductListItemsVM
     var viewController: ProductListItemsVC
    
    required init(services: Services) {
        contentView = ProductListItemsCV()
        viewModel = ProductListItemsVM()
        viewModel.services = services
        viewController = ProductListItemsVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> ProductListItemsVC {
        return viewController
    }
}
