//
//  OrderBuilder.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//

final class OrderBuilder: ModuleBuilder {
    var contentView: OrderCV
    var viewModel: OrderVM
    var viewController: OrderVC
    
    required init(services: Services) {
        contentView = OrderCV()
        viewModel = OrderVM()
        viewModel.services = services
        viewController = OrderVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> OrderVC {
        return viewController
    }
}
