//
//  CollectProductListBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 12/2/26.
//

final class CollectProductListBuilder: ModuleBuilder {
     var contentView: CollectProductListCV
     var viewModel: CollectProductListVM
     var viewController: CollectProductListVC
    
    required init(services: Services) {
        contentView = CollectProductListCV()
        viewModel = CollectProductListVM()
        viewModel.services = services
        viewController = CollectProductListVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> CollectProductListVC {
        return viewController
    }
}
